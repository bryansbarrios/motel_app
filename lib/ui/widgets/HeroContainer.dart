import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:motel_app/core/services/AuthService.dart';

class Constants{
  static const String logoff = 'Cerrar sesión';

  static const List<String> choices = <String>[
    logoff
  ];
}

class HeroContainer extends StatelessWidget {
  final AuthService _auth = AuthService();

  final String fullName;

  HeroContainer({this.fullName});

  final h1 = TextStyle(
    fontSize: 22,
    color: Color.fromRGBO(255, 255, 255, .9),
    fontWeight: FontWeight.w600
  );

  final h2 = TextStyle(
    fontSize: 18,
    color: Color.fromRGBO(255, 255, 255, .9),
  );

  final h3 = TextStyle(
    fontSize: 16,
    color: Color.fromRGBO(255, 255, 255, .9),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromRGBO(44,62,80,1),
            Color.fromRGBO(52,152,219,1)
          ]
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Hola, $fullName", style: h3,),
                PopupMenuButton<String>(
                  child: CircleAvatar(
                      radius: 25.0,
                      backgroundImage: NetworkImage("https://res.cloudinary.com/dejau9zgq/image/upload/v1590269990/Profile.png"), 
                      backgroundColor: Colors.transparent
                  ),
                  itemBuilder: (BuildContext context){
                    return Constants.choices.map((String choice){
                      return PopupMenuItem<String>(
                        value: choice,
                        child: GestureDetector(
                          child: Text(choice),
                          onTap: () async{
                            if(choice == 'Cerrar sesión'){
                              await _auth.signOut();
                              Fluttertoast.showToast(
                                msg: "Has cerrado sesión",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                textColor: Colors.black,
                                fontSize: 14.0
                              );
                              Navigator.of(context).pushNamedAndRemoveUntil('/noLogin', (Route<dynamic> route) => false);
                            }
                          },
                        ),
                      );
                    }).toList();
                  }
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text("Busca tu motel", style: h1,),
                    Text("Moteles populares", style: h2,),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  } 
}