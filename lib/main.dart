import 'package:cliques_demo/screens/clique_widget.dart';
import 'package:flutter/material.dart';
import 'package:cliques_demo/models/clique.dart';  // Make sure the import path is correct

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clique Cards',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cliques'),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: CliqueList(),
        ),
      ),
    );
  }
}