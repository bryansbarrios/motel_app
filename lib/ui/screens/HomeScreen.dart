import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:motel_app/core/models/User.dart';
import 'package:motel_app/core/services/AuthService.dart';
import 'package:motel_app/core/viewmodels/UserViewModel.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final AuthService _auth = AuthService();
  String _currentUser = '';

  void getCurrentUser() async {
    FirebaseUser result = await _auth.getCurrentUser();
    //_currentUser = result.uid;
  } 

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserViewModel>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        child: Center(
          child: FutureBuilder(
            future: userProvider.getUserById("t5D5q1FT96P3mMfEwMeZRVM6rrF3"),
            builder: (context, snapshoot) {
              if (snapshoot.hasData) {
                UserData user = snapshoot.data;
                return Text("Nombre completo: ${user.fullName}");
              }
            },
          ),
        )
      )
    );
  }
}
