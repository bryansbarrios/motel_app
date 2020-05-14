import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:motel_app/core/models/Motel.dart';
import 'package:motel_app/core/models/User.dart';
import 'package:motel_app/core/services/AuthService.dart';
import 'package:motel_app/core/viewmodels/MotelViewModel.dart';
import 'package:motel_app/core/viewmodels/UserViewModel.dart';
import 'package:motel_app/ui/screens/MotelDetailScreen.dart';
import 'package:motel_app/ui/widgets/HomeScreenExpanded.dart';
import 'package:provider/provider.dart';

import 'HomeScreenContainers.dart';

int acc = 0;

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
              SizedBox(height: 50,),
              FutureBuilder(
                future: userProvider.getUserById(uid),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    UserData user = snapshot.data;
                    print("Nombre: ${user.fullName}");
                    return createContainer('Saludo e imagen', 'https://source.unsplash.com/random/200x200', user.fullName);
                  }
                  return Padding(
                    padding: EdgeInsets.all(20),
                    child: Center(
                        child: CircularProgressIndicator(),
                    ),
                  );
                },
              ),
              createContainer('Busca tu motel', null, null),
              createContainer('Moteles populares', null, null),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.all(10),
                  shrinkWrap: true,
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
                                type: motel.typeId,
                                description: motel.description,
                                address: motel.address,
                                location: motel.location,
                                photo: motel.photo,
                                price: motel.price
                              )),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.white,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, .4),
                                  blurRadius: 4,
                                )
                              ]
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Column(
                                children: <Widget>[
                                  LimitedBox(
                                    maxHeight: 168,
                                    maxWidth: double.infinity,
                                    child: FadeInImage(
                                      image: NetworkImage(motel.photo),
                                      placeholder: AssetImage('assets/loading.gif'),
                                      width: 400,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      children: <Widget>[
                                      createExpanded(motel.motelName, 1),
                                      createExpanded('5.0', 2),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      children: <Widget>[
                                        createExpanded('Masaya', 3),
                                        createExpanded(motel.price, 4),
                                      ],
                                    )
                                  )
                                ],
                              )
                            ),
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
    }); // here you write the codes to input the data into firestore
  }
}