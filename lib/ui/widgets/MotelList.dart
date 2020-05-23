import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:motel_app/core/models/Motel.dart';
import 'package:motel_app/core/models/User.dart';
import 'package:motel_app/core/services/AuthService.dart';
import 'package:motel_app/core/viewmodels/MotelViewModel.dart';
import 'package:motel_app/core/viewmodels/UserViewModel.dart';
import 'package:motel_app/ui/screens/MotelDetailScreen.dart';
import 'package:motel_app/ui/widgets/HeroContainer.dart';
import 'package:provider/provider.dart';
import 'MotelCard.dart';

Random _random = new Random();
int randomNumber(int min, int max) => min + _random.nextInt(max - min);

class MotelList extends StatefulWidget {
  @override
  _MotelListState createState() => _MotelListState();
}

class _MotelListState extends State<MotelList> {
  final AuthService _auth = AuthService();
  String uid = "";

  @override
  void initState() { 
    super.initState();
    getUid();
  }

  @override
  Widget build(BuildContext context) {
    final motelProvider = Provider.of<MotelViewModel>(context);
    final userProvider = Provider.of<UserViewModel>(context);
    return FutureBuilder(
      future: motelProvider.fetchMotels(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List<Motel> motels = snapshot.data;
          return Column(
            children: <Widget>[
              FutureBuilder(
                future: userProvider.getUserById(uid),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    UserData user = snapshot.data;
                    print("Nombre: ${user.fullName}");
                    return HeroContainer(fullName: user.fullName);
                  }
                  return Padding(
                    padding: EdgeInsets.all(0),
                    child: Center(
                        child: CircularProgressIndicator(),
                    ),
                  );
                },
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.all(15),
                  shrinkWrap: false,
                  scrollDirection: Axis.vertical, 
                  children: motels.map((motel) => 
                    Column(
                      children: <Widget> [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MotelDetailScreen(
                                motelName: motel.motelName,
                                description: motel.description,
                                address: motel.address,
                                location: motel.location,
                                photo: motel.photo,
                                price: motel.price,
                                type: motel.typeId,
                              )),
                            );
                          },
                          child: MotelCard(
                            motelName: motel.motelName,
                            city: "Masaya",
                            price: motel.price,
                            rating: randomNumber(1, 5).toString(),
                            photo: motel.photo,
                            type: "Popular",
                          ),
                        ),
                      ],
                    )
                  ).toList()
                ),
              )
            ],
          );
        } 
        else {
          return Center(child: CircularProgressIndicator());
        } 
      }
    );
  }

  void getUid() async {
    final FirebaseUser user = await _auth.getCurrentUser();
    setState(() {
      uid = user.uid;
    });
  }
}