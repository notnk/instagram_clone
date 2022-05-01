import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/widgets/text_field_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController= TextEditingController();
  final TextEditingController _passwordController= TextEditingController();

  @override
  //the controllers gets disposed after the use
  void dispose(){
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(child: Container(),flex: 2,),
              //svg image
              SvgPicture.asset('assets/ic_instagram.svg',height: 64,color: Colors.white,),
              const SizedBox(height: 64,),
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
                const SizedBox(height: 24,),
              //button login
              Container(
                child:const Text('Log in'),
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
                  GestureDetector(
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