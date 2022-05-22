import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/PostCard.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: SvgPicture.asset(
          'assets/ic_instagram.svg',
          color: Colors.white,
          height: 32,
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.message_outlined)),
        ],
      ),
      body: const PostCard(),
    );
  }
}
