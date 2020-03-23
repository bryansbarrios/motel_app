import 'package:flutter/material.dart';

Widget createContainer (String title){
  if(title=='Busca tu motel')
  {
    return Container(
      width: 360,
      padding: EdgeInsets.fromLTRB(45.0, 20.0, 30.0, 0.0),
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
    if(title=='Moteles cerca de ti')
    {
      return Container(
        width: 360,
        padding: EdgeInsets.fromLTRB(45.0, 20.0, 30.0, 0.0),
        child: 
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(title, style: 
            TextStyle(
              fontSize: 20, fontFamily: 'Inter', 
              color: Colors.grey[800],
              fontWeight: FontWeight.bold,
            )
          ),
        ),
      );
    }
    else
    {
      return Container(
        width: 360,
        padding: EdgeInsets.fromLTRB(45.0, 20.0, 30.0, 0.0),
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