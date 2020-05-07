import 'package:flutter/material.dart';
import 'package:motel_app/ui/widgets/MotelList.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: MotelList(), 
    );
  }
}