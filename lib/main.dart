import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/providers/user_provider.dart';
import 'package:instagram_clone/responsive/mobile_screen_layout.dart';
import 'package:instagram_clone/responsive/responsive_screen_layout.dart';
import 'package:instagram_clone/responsive/web_screen_layout.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:instagram_clone/screens/login.dart';
import 'package:instagram_clone/screens/signup_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_)=>UserProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        title: 'Instagram clone',
        home: SignupScreen(),
        // home: StreamBuilder(
        //   stream: FirebaseAuth.instance.authStateChanges(),
        //   builder: (context,snapshot){
        //     if(snapshot.connectionState == ConnectionState.active){
        //       if(snapshot.hasData){
        //         return const ResponsiveLayout(
        //           mobileScreenLayout: MobileScreenLayout(), 
        //           webScreenLayout: WebScreenLayout()
        //         );
        //       }else if(snapshot.hasError){
        //         return Center(
        //           child: Text('${snapshot.error}'),
        //         );
        //       }
        //     }
        //     if(snapshot.connectionState == ConnectionState.waiting){
        //       return const Center(
        //         child: CircularProgressIndicator(
        //           color: Colors.white,
        //         ),
        //       );
        //     }
        //     return const LoginScreen();
        //   },
        // ),
      ),
    );
  }
}