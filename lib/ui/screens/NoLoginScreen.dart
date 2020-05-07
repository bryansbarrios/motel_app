import 'package:flutter/material.dart';
import 'package:motel_app/ui/shared/ToLoginButton.dart';
import 'package:motel_app/ui/shared/ToRegisterButton.dart';
class NoLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).backgroundColor,
        width: double.infinity,
        child: ListView(
          padding: EdgeInsets.all(30),
          children: <Widget>[
            SizedBox(height: 40),
            Container(
              child: Column(
                children: <Widget>[
                  LimitedBox(
                    maxHeight: 300,
                    maxWidth: double.infinity,
                    child: Image(
                      image: AssetImage('images/room_key.png'),
                      height: 340,
                      width: double.infinity,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Inicia sesión o regístrate para calificar y guardar tus moteles favoritos.', 
                    textAlign: TextAlign.center, 
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18.0,
                      color: Color.fromRGBO(80,85,97,.5)
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 60),
                  ToLoginButton(),
                  SizedBox(height: 20),
                  ToRegisterButton(),
                ],
              )
            ),
            SizedBox(height: 20),
          ],
        )
      ),
    );
  }
}