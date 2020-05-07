import 'package:flutter/material.dart';
import 'package:motel_app/core/models/User.dart';
import 'package:motel_app/core/services/AuthService.dart';
import 'package:motel_app/core/viewmodels/UserViewModel.dart';
import 'package:motel_app/ui/shared/LoginFooter.dart';
import 'package:motel_app/ui/shared/LoginHeader.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterScreen extends StatefulWidget {

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();

  final AuthService _auth = AuthService();

  TextEditingController _fullNameController;
  TextEditingController _emailController;
  TextEditingController _passwordController;

  bool _showPassword = false;
  bool loading = false;

  @override
  void initState() { 
    super.initState();
    _fullNameController = TextEditingController(text: "");
    _emailController = TextEditingController(text: "");  
    _passwordController = TextEditingController(text: "");  
    }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserViewModel>(context);

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
              LoginHeader("REGÍSTRATE", "Califica los moteles según tu experiencia"),
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
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Nombre completo',
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
                          hintText: 'Ingresa tu nombre y apellidos',
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
                        controller: _fullNameController,
                        validator: (value) => (value.isEmpty) ? "*Requerido" : null,
                      ),
                      SizedBox(height: 30),
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
                          validator: (value) => _validatePassword(value),
                        ),
                        SizedBox(height: 30),
                        !loading ? InkWell(
                          onTap: () async{
                            if (_formKey.currentState.validate()) {
                              setState(() => loading = true);
                              dynamic result = await _auth.registerWithEmailAndPassword(_emailController.text, _passwordController.text);
                              if (result == "The email address is already in use by another account.") {
                                _key.currentState.showSnackBar(SnackBar(content: Text("Correo electrónico en uso")));
                                setState(() => loading = false);
                              } 
                              else {
                                await userProvider.addUser(
                                  UserData(
                                    uid: result, 
                                    fullName: _fullNameController.text, 
                                    email: _emailController.text
                                  ),
                                  result
                                );
                                Fluttertoast.showToast(
                                  msg: "Cuenta creada exitosamente. Inicia sesión",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  textColor: Colors.black,
                                  fontSize: 14.0
                                );
                                Navigator.popAndPushNamed(context, '/login');
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
                                "Regístrate",
                                style: TextStyle(
                                  color: Color.fromRGBO(0,122,253,1),
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600
                                ),
                              )
                            ),
                          ),
                        ) : showLoading(),
                      SizedBox(height: 30),
                      LoginFooter('¿Ya tienes una cuenta?', 'Inicia sesión', '/login')
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }

  Widget showLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  String _validateEmail(String email) { 
    Pattern emailPattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regex = RegExp(emailPattern);
    if (email.isEmpty) return "*Requerido";
    else if (!regex.hasMatch(email)) return "Introduzca un correo electrónico válido";
    else return null;
  }

  String _validatePassword(String password) { 
    Pattern passwordPattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = RegExp(passwordPattern);
    if (password.isEmpty) return "*Requerido";
    else if (password.length < 8) return "La contraseña debe tener al menos 8 caracteres";
    else if (!regex.hasMatch(password)) return "La contraseña debe contener mayúsculas, minúsculas, números \ny caracteres especiales";
    else return null;
  }
}