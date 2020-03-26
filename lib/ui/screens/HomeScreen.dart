import 'package:flutter/material.dart';
import 'package:motel_app/ui/widgets/HomeScreenContainers.dart';
import 'package:motel_app/ui/widgets/MotelList.dart';

class HomeScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: ListView (
        shrinkWrap: true,
          children: <Widget>[
            createContainer('Busca tu motel'),
            createContainer('Moteles cerca de ti'),
            createContainer('Moteles populares'),
            MotelList(),
          ]
        )  
      );
  }
}






