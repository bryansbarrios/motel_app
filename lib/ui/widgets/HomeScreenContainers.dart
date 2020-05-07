import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:motel_app/core/services/AuthService.dart';

class Constants{
  static const String logoff = 'Cerrar sesión';
  static const List<String> choices = <String>[
    logoff
  ];
}

Widget createContainer (String title, String image, String name)
{
  final AuthService _auth = AuthService();

  if(title=='Busca tu motel')
  {
    return Container(
      width: 360,
      padding: EdgeInsets.fromLTRB(0.0, 0.0, 30.0, 0.0),
      child: 
      Align(
        alignment: Alignment.bottomLeft,
        child: Text(title, style: 
          TextStyle(
            fontSize: 24, fontFamily: 'Inter', 
            color: Colors.grey[800],
            fontWeight: FontWeight.w800,
          )
        ),
      ),
    );
  }
  else
  {
    if(title=='Saludo e imagen')
    {
      return Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(25.0, 50.0, 225.0, 25.0),
            child:
            Text("Hola, $name", style:
              TextStyle(
                fontSize: 16, fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.left, 
            )
          ),
          PopupMenuButton<String>(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 50.0, 0.0, 0.0),
                child: Tab(
                  icon: new Image.network(image),
                )
              ),
            itemBuilder: (BuildContext context){
              return Constants.choices.map((String choice){
                return PopupMenuItem<String>(
                  value: choice,
                  child: GestureDetector(
                    child: Text(Constants.logoff),
                    onTap: () async {
                      if (choice == Constants.logoff) {
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
      );
    }
    else
    {
      return Container(
        width: 360,
        padding: EdgeInsets.fromLTRB(0.0, 20.0, 30.0, 10.0),
        child: Text(title, style: 
          TextStyle(
            fontSize: 20, fontFamily: 'Inter', 
            color: Colors.grey[800],
            fontWeight: FontWeight.w800,
          )
        ),
      );
    }
  }
}