import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/providers/user_provider.dart';
import 'package:instagram_clone/models/user.dart' as model;
import 'package:instagram_clone/utils/global_varialbles.dart';
import 'package:provider/provider.dart';

import '../screens/add_post_screen.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({ Key? key }) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int _page=0;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }
  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }
  void navigationTapped(int page){
    pageController.jumpToPage(page);
  }
  void onPageChanged(int page){
    setState(() {
      _page = page;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          children: homeScreenItems ,
          controller: pageController,
          onPageChanged: onPageChanged,
          physics: const NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home,color: _page==0? Colors.white:Colors.grey,),
              label: '',
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search,color: _page==1? Colors.white:Colors.grey,),
              label: '',
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle ,color: _page==2? Colors.white:Colors.grey,),
              label: '',
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite,color: _page==3? Colors.white:Colors.grey,),
              label: '',
              backgroundColor: Colors.black, 
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person,color: _page==4? Colors.white:Colors.grey,),
              label: '',
              backgroundColor: Colors.black,
            ),
          ],
          onTap: navigationTapped,
        )
      ),
    );
  }
}