import 'package:cloud_firestore/cloud_firestore.dart';

class User{

  final String username;
  final String bio;
  final String photoUrl;
  final List followers;
  final List following;
  final String email;
  final String uid;

  const User({
    required this.bio,
    required this.followers,
    required this.following,
    required this.username,
    required this.email,
    required this.uid,
    required this.photoUrl,
  });

  Map<String,dynamic> toJson() =>{
    'username':username,
    'bio':bio,
    'email':email,
    'followers':followers,
    'following':following,
    'uid':uid,
  };

  static User fromSnap(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String,dynamic>;
    return User(
      bio: snapshot['bio'], 
      followers: snapshot['followers'], 
      following: snapshot['following'], 
      username: snapshot['username'], 
      email: snapshot['email'], 
      uid: snapshot['uid'],
      photoUrl: snapshot['photoUrl']
      );
  }
}