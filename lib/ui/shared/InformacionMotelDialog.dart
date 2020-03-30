import 'package:flutter/material.dart';


import 'package:motel_app/core/models/Motel.dart';


Future<Widget> verInfoMotel(Motel motel, BuildContext context) {
/*
String id;
  String typeId;
  String motelName;
  String description;
  String address;
  //GeoPoint location;
  String photo;
  String availableServices;
  String price;
*/
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {

      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        title: Text('${motel.motelName}', textAlign: TextAlign.center,),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image(
              image: NetworkImage(motel.photo),
            ),
            Divider(),
            Text('Descripción: ${motel.description}', textAlign: TextAlign.justify),
            Divider(),
            Text('Dirección: ${motel.address}', textAlign: TextAlign.justify)

          ],
          ),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },)
        ],

      );

    }
    
    
    );




}