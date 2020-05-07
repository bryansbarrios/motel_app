import 'package:flutter/material.dart';
import 'package:motel_app/core/services/AuthService.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthService _auth = AuthService();
  bool verified = false;

  @override
  void initState() { 
    super.initState();
    verifyLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color.fromRGBO(131,164,212,1), Color.fromRGBO(182,251,255,1)]
        )
      ),
      height: double.infinity,
      width: double.infinity,
    );
  }

  void verifyLogin() async {
    var response = await _auth.getCurrentUser();
    if (response != null) {
      Navigator.pushReplacementNamed(context, '/verified');
    }
    else {
      Navigator.pushNamed(context, '/noLogin');
    }
  }
}