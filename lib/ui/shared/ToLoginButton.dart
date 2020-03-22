import 'package:flutter/material.dart';

class ToLoginButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, '/login');
          
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
              'Iniciar sesión',
              style: TextStyle(
                color: Color.fromRGBO(0,122,253,1),
                fontSize: 18.0,
                fontWeight: FontWeight.w600
              ),
            )
          ),
      ),
    );
  }
}