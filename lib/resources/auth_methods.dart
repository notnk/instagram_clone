import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/resources/storage_methods.dart';
import 'package:instagram_clone/models/user.dart' as model ;


class AuthMethods{
  
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.User?> getUserDetails() async {

    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap = await _firestore.collection('users').doc(currentUser.uid).get();
    return model.User.fromSnap(snap);
  
  }

  //signup user
  Future<String>signUpUser({
    required String username,
    required String password,
    required String email,
    required String bio,
    required Uint8List file,
    }) async {
      String res="error occured";
      try{
        if(username.isNotEmpty||password.isNotEmpty||bio.isNotEmpty){
          //reg user
          UserCredential cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);
          print(cred.user!.uid);
          String photoUrl = await StorageMethods().uploadImageToStorage('profilePics', file, false);
         
          //add user to db

          model.User user = model.User(
            bio: bio,
            email: email,
            followers: [],
            following: [],
            uid: cred.user!.uid,
            username: username,
            photoUrl: photoUrl,
          );

          await _firestore.collection('users').doc(cred.user!.uid).set(user.toJson(),);
          res='success';
        }
      }catch(e){
        res=e.toString();
      }
      return res;
    }
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = 'Error Occured';
    try{
      if(email==null||password==null){
        await _auth.signInWithEmailAndPassword(email: email, password: password);
        res = 'success';
      }else{
        res = 'Details cant be null';
      }
    }catch(e){
      res = e.toString();
    }
    return res;
  }
}