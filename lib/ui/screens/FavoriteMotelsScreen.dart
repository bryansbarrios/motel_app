import 'package:flutter/material.dart';


import 'package:motel_app/ui/shared/CurvedNavBar.dart';

class FavoriteMotelsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Favorite Motels Screen'),
      ),
      bottomNavigationBar: CurvedNavBar(),
    );
  }
}