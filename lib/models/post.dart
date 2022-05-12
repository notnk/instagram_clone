import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String username;
  final String description;
  final String postUrl;
  final datePublished;
  final String uid;
  final String postId;
  final String porfImage;
  final likes;

  const Post({
    required this.description,
    required this.postUrl,
    required this.datePublished,
    required this.postId,
    required this.porfImage,
    required this.likes, 
    required this.username,
    required this.uid,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'description': description,
        'datePublished': datePublished,
        'postId': postId,
        'porfImage': porfImage,
        'postUrl': postUrl,
        'uid': uid,
        'likes':likes,
      };

  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Post(
        description: snapshot['description'],
        postUrl: snapshot['postUrl'],
        porfImage: snapshot['porfImage'],
        username: snapshot['username'],
        postId: snapshot['postId'],
        uid: snapshot['uid'],
        datePublished: snapshot['datePublished'],
        likes: snapshot['likes'],
        );
  }
}
