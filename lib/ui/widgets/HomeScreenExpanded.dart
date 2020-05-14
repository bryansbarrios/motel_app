import 'package:flutter/material.dart';

Widget createExpanded (String text, int opc){

  if(opc == 1){
    return Expanded(
      flex: 7,
      child: Text(text, textAlign: TextAlign.left, style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
        ),
      )
    );
  }
  else{
    if(opc == 2){
      return Expanded(
        flex: 5,
        child: Text(text, textAlign: TextAlign.right, style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14,
          ),
        )
      );
    }
    else{
      if(opc == 3){
        return Expanded(
          flex: 5,
          child: Text(text, textAlign: TextAlign.left, style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,

            ),
          )
        );
      }
      else{
        return Expanded(
          flex: 5,
          child: Text(text, textAlign: TextAlign.right, style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,

            ),
          )
        );
      } 
    }
  }
}