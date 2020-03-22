import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motel_app/ui/shared/ToLoginButton.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.blue[900],
              Colors.blue[700],
              Colors.blue[500],
            ]
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 30,),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon (
                      Icons.arrow_back,
                      color: Colors.white70
                    ),
                  ),
                  SizedBox(height: 30,),
                  Text(
                    'INICIAR SESIÓN',
                    style: GoogleFonts.nunitoSans(
                      fontSize: 24,
                      color: Colors.white70,
                      fontWeight: FontWeight.w700
                    )
                  ),
                  Text(
                    'Accede fácilmente a tus moteles favoritos.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                      fontWeight: FontWeight.w500
                    )  
                  )
                ]
              ),
            ),
            SizedBox(height: 10,),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: Colors.white
                ),
                child: ListView(
                  padding: EdgeInsets.all(30),
                  children: <Widget>[
                    Text(
                      'Correo Electrónico',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.grey[600]
                      ),

                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      cursorColor: Colors.blue,
                      decoration: InputDecoration(
                        hintText: 'Ingresa tu correo electrónico',
                        hintStyle: TextStyle(
                          color: Colors.grey[500],
                        ),
                        filled: true,
                        fillColor: Color.fromRGBO(248,249,253,1),
                        focusColor: Color.fromRGBO(248,249,253,1),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(248,249,253,1)
                          )
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )
                      ),
                      style: TextStyle(
                        fontSize: 18,
                      )
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Contraseña',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.grey[600]
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                      cursorColor: Colors.blue,
                      decoration: InputDecoration(
                        hintText: 'Crea tu contraseña',
                        hintStyle: TextStyle(
                          color: Colors.grey[500],
                        ),
                        filled: true,
                        fillColor: Color.fromRGBO(248,249,253,1),
                        focusColor: Color.fromRGBO(248,249,253,1),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(248,249,253,1)
                          )
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )
                      ),
                      style: TextStyle(
                        fontSize: 18,
                      )
                    ),
                    SizedBox(height: 30),
                    ToLoginButton(),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '¿Aún no tienes una cuenta?',
                          style: TextStyle(fontSize: 16, color: Colors.grey[600]), 
                        ),
                        SizedBox(width: 6),
                        GestureDetector(
                          onTap: (){Navigator.pushNamed(context, '/register');},
                          child: Text(
                            'Regístrate',
                            style: TextStyle(fontSize: 16, color: Color.fromRGBO(0,122,253,1), fontWeight: FontWeight.bold), 
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}