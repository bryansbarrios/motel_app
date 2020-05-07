import 'package:flutter/material.dart';

class Constants{
  static const String logoff = 'Cerrar sesión';

  static const List<String> choices = <String>[
    logoff
  ];
}

Widget createContainer (String title, String image, String name)
{
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
            fontSize: 28, fontFamily: 'Inter', 
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
            padding: EdgeInsets.fromLTRB(25.0, 70.0, 225.0, 20.0),
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
                padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
                child: Tab(
                  icon: new Image.network(image),
                )
              ),
            padding: EdgeInsets.fromLTRB(50.0, 0.0, 0.0, 0.0),
            itemBuilder: (BuildContext context){
              return Constants.choices.map((String choice){
                return PopupMenuItem<String>(
                  value: choice,
                  child: ListTile(
                    title: Text(choice),
                    onTap: (){
                      if(choice == 'Cerrar sesión'){
                        print('Adiós José');
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


