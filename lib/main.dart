import 'package:flutter/material.dart';
import 'package:instagram_clone/responsive/mobile_screen_layout.dart';
import 'package:instagram_clone/responsive/responsive_screen_layout.dart';
import 'package:instagram_clone/responsive/web_screen_layout.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:instagram_clone/screens/login.dart';
import 'package:instagram_clone/screens/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      // home: const ResponsiveLayout(
      //   mobileScreenLayout: MobileScreenLayout(), 
      //   webScreenLayout: WebScreenLayout()
      //   ),
      home: const SignupScreen(),
    );
  }
}