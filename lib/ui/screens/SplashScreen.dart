import 'package:firebase_auth/firebase_auth.dart';
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
    if (verified) {
      Navigator.pushReplacementNamed(context, 'verified');
    }
    else  {
      Navigator.pushReplacementNamed(context, '/noLogin');
    }
  }

  void verifyLogin() async {
    final FirebaseUser user = await _auth.getCurrentUser();
    setState(() {
      if (user != null) verified =  true;
    });
  }
}