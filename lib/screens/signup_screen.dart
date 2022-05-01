import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/resources/auth_methods.dart';
import 'package:instagram_clone/widgets/text_field_input.dart';

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


  @override
  //the controllers gets disposed after the use
  void dispose(){
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
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
                  const CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage('https://images.unsplash.com/photo-1644982647869-e1337f992828?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHw2fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60'),
                  ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: (){},
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
                onTap: () async {
                  String res = await AuthMethods().signUpUser(
                    email:_emailController.text,
                    password:_passwordController.text,
                    username:_usernameController.text,
                    bio: _bioController.text,
                  );
                  print(res);
                },
                child: Container(
                  child:const Text('Sign Up'),
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
                    child: const Text('Dont have a account?'),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      child: const Text(
                        'Sign up?',
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