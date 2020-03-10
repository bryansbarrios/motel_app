import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class CurvedNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      height: 52.0,
      items: <Widget>[
        Icon(Icons.hotel, size: 24, color: Color.fromRGBO(35,35,34,1)),
        Icon(Icons.search, size: 24, color: Color.fromRGBO(35,35,34,1)),
        Icon(Icons.favorite, size: 24, color: Color.fromRGBO(35,35,34,1)),
        Icon(Icons.map, size: 24, color: Color.fromRGBO(35,35,34,1)),
      ],
      color: Colors.white,
      buttonBackgroundColor: Colors.white,
      backgroundColor: Color.fromRGBO(245,250,255,1),
      animationCurve: Curves.easeInOut,
      animationDuration: Duration(milliseconds: 600),
    );
  }
}