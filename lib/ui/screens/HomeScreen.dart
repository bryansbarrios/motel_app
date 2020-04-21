import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({this.uid, this.fullName});
  
  final String uid;
  final String fullName;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String get fullName => fullName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        child: Center(child: Text(fullName),),
      )
    );
  }
}
