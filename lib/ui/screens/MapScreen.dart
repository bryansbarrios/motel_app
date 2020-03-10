import 'package:flutter/material.dart';

import 'package:motel_app/ui/shared/CurvedNavBar.dart';

class MapScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Map Screen'),
      ),
      bottomNavigationBar: CurvedNavBar(),
    );
  }
}