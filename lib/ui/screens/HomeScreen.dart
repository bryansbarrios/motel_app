import 'package:flutter/material.dart';
import 'package:motel_app/ui/shared/CurvedNavBar.dart';
import 'package:motel_app/ui/widgets/MotelList.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MotelList(),
      bottomNavigationBar: CurvedNavBar(),
    );
  }
}