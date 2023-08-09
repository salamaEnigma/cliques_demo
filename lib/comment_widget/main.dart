import 'comment_widget.dart';
import 'comment_module.dart';

import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Comment myComment = Comment(
      author: 'fahd salman',
      content:  'This is the content of my comment.',
      date: '8:47 AM · Aug 4, 2023',
      imageUrl: null,
      videoUrl: null,
      userProfilePictureUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR39c7eSH37eNjY05x7MdPcCDqIqBRgIETVzZORfrwA&s',
    );

    return MaterialApp(
      home: Scaffold(
        body: CommentWidget(comment: myComment),
      ),
    );
  }
}