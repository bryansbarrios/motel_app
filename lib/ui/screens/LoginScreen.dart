import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:motel_app/ui/shared/LoginFooter.dart';
import 'package:motel_app/ui/shared/LoginHeader.dart';

import '../../core/services/AuthService.dart';

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();

  final AuthService _auth = AuthService();

  TextEditingController _emailController;
  TextEditingController _passwordController;

  bool _showPassword = false;

  @override
  void initState() { 
    super.initState();
    _emailController = TextEditingController(text: "");  
    _passwordController = TextEditingController(text: "");  
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
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
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              LoginHeader("INICIAR SESIÓN", "Accede fácilmente a tus moteles favoritos"),
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
                    shrinkWrap: true,
                    padding: EdgeInsets.all(30),
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Correo electrónico',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.grey[500]
                          ),
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
                        ),
                        controller: _emailController,
                        validator: (value) => _validateEmail(value)
                      ),
                      SizedBox(height: 30),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Contraseña',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.grey[500]
                          ),

                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        keyboardType: TextInputType.text,
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
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _showPassword = !_showPassword;
                              });
                            },
                            child: Icon(
                              _showPassword ? Icons.visibility : Icons.visibility_off,
                              color: Colors.grey[400],
                            ),
                          )
                        ),
                        obscureText: !_showPassword,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        controller: _passwordController,
                        validator: (value) => (value.isEmpty) ? "*Requerido" : null,
                      ),
                      SizedBox(height: 30),
                      InkWell(
                        onTap: () async {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            dynamic result = await _auth.signInWithEmailAndPassword(_emailController.text, _passwordController.text);
                            if (result == "The password is invalid or the user does not have a password.") {
                              _key.currentState.showSnackBar(SnackBar(content: Text("Correo electrónico o contraseña incorrecta")));
                            } else if (result == "There is no user record corresponding to this identifier. The user may have been deleted.") {
                              _key.currentState.showSnackBar(SnackBar(content: Text("Correo electrónico no registrado")));
                            } else {
                              Fluttertoast.showToast(
                                msg: "Inicio sesión exitoso",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                textColor: Colors.black,
                                fontSize: 14.0
                              );
                              Navigator.of(context).pushNamedAndRemoveUntil('/verified', (Route<dynamic> route) => false);
                            }
                          }
                        },
                        child: Container(
                          height: 58,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromRGBO(0,122,253,1),
                              width: 2
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "Iniciar sesión",
                              style: TextStyle(
                                color: Color.fromRGBO(0,122,253,1),
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600
                              ),
                            ) 
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      LoginFooter('¿Aún no tienes una cuenta?', 'Regístrate', '/register')
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String _validateEmail(String email) { 
    Pattern emailPattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regex = RegExp(emailPattern);
    if (email.isEmpty) return "*Requerido";
    else if (!regex.hasMatch(email)) return "Introduzca un correo electrónico válido";
    else return null;
  }
}