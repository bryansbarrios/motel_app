import 'package:flutter/material.dart';

class LoginFooter  extends StatelessWidget {
  final String _text, _link, _route;

  LoginFooter(this._text, this._link, this._route);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          _text,
          style: TextStyle(fontSize: 16, color: Colors.grey[600]), 
        ),
        SizedBox(width: 6),
        GestureDetector(
          onTap: (){Navigator.pushNamed(context, _route);},
          child: Text(
            _link,
            style: TextStyle(fontSize: 16, color: Color.fromRGBO(0,122,253,1), fontWeight: FontWeight.bold), 
          ),
        ),
      ],
    );
  }
}