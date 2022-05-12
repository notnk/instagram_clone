import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/resources/auth_methods.dart';
import 'package:instagram_clone/responsive/mobile_screen_layout.dart';
import 'package:instagram_clone/screens/login.dart';
import 'package:instagram_clone/utils/utils.dart';
import 'package:instagram_clone/widgets/text_field_input.dart';
import '../responsive/responsive_screen_layout.dart';
import '../responsive/web_screen_layout.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({ Key? key }) : super(key: key);

  @override
  State<SignupScreen> createState() => SignupScreenState();
}

class SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController= TextEditingController();
  final TextEditingController _passwordController= TextEditingController();
  final TextEditingController _bioController= TextEditingController();
  final TextEditingController _usernameController= TextEditingController();
  Uint8List? _image;
  bool _isLoading = false;

  @override
  //the controllers gets disposed after the use
  void dispose(){
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

   void selectImage() async {
   Uint8List im = await pickImage(ImageSource.gallery);
   setState(() {
     _image=im;
   });
  }

  void signUpUser() async {
  setState(() {
    _isLoading = true;
  });
  String res = await AuthMethods().signUpUser(
    email:_emailController.text,
    password:_passwordController.text,
    username:_usernameController.text,
    bio: _bioController.text, 
    file: _image!,
    );
    setState(() {
      _isLoading = false;
    });
    if(res!='success'){
      showSnackBar(res, context);
    }else{
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context)=>const ResponsiveLayout(
                mobileScreenLayout: MobileScreenLayout(), 
                webScreenLayout: WebScreenLayout()
          )
        )
      );
    }
  }

  void navigateToLogin(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const LoginScreen()));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(child: Container(),flex: 1,),
              //svg image
              SvgPicture.asset('assets/ic_instagram.svg',height: 64,color: Colors.white,),
              const SizedBox(height: 64,),
              //circular widget to accpect to show our selected file
              Stack(
                children: [
                  _image!=null? CircleAvatar(
                    radius: 64,
                    backgroundImage: MemoryImage(_image!),
                  ):
                  const CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage('https://t4.ftcdn.net/jpg/00/64/67/63/360_F_64676383_LdbmhiNM6Ypzb3FM4PPuFP9rHe7ri8Ju.jpg'),
                  ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: selectImage,
                      icon: const Icon(Icons.add_a_photo),
                    ),
                  ), 
                ],
              ),
              const SizedBox(height: 24,),
              //text Field input for username
              TextFiledInput(
                textEditingController: _usernameController, 
                hintText: 'Enter Your Username', 
                textInputType: TextInputType.text,
                ),
                const SizedBox(height: 24,),
              //text filed input for email
              TextFiledInput(
                textEditingController: _emailController, 
                hintText: 'Enter Your Email', 
                textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 24,),
              //text filed input for password
              TextFiledInput(
                textEditingController: _passwordController, 
                hintText: 'Enter Your Password', 
                textInputType: TextInputType.text,
                isPass: true,
                ),
                //text input field for bio
                const SizedBox(height: 24,),
                TextFiledInput(
                textEditingController: _bioController, 
                hintText: 'Enter Your Bio', 
                textInputType: TextInputType.text,
                ),
                const SizedBox(height: 24,),
              //button login
              InkWell(
                onTap:()=> signUpUser(),
                child: Container(
                  child: _isLoading? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ), 
                    ):const Text('Sign Up'),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12,),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4),
                      ),
                    ),
                    color: Colors.blue,
                    ),
                ),
              ),
               const SizedBox(height: 12,),
               Flexible(child: Container(),flex: 2,),
              //transcating to signup 
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: const Text('have a account?'),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  GestureDetector(
                    onTap: () =>navigateToLogin(),
                    child: Container(
                      child: const Text(
                        'Login?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          ),
                        ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),
                ],
              ),
            ]
          ),
        ),
      ),
    );
  }
}