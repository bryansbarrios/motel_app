import 'package:flutter/material.dart';

class ToRegisterButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, '/register');
        },
        child: Container(
          height: 58,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color.fromRGBO(0,122,253,1),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [ 
              BoxShadow(
                color: Color.fromRGBO(0,122,253,.2),
                blurRadius: 25,
              )
            ]
          ),
          child: Center(
            child: Text(
              'Regístrate',
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, .8),
                fontSize: 18.0,
                fontWeight: FontWeight.w600
              ),
            )
          ),
      ),
    );
  }
}