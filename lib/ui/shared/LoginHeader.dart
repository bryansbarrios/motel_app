import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginHeader extends StatelessWidget {
  final String _title, _subtitle;

  LoginHeader(this._title, this._subtitle);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  _title,
                  style: GoogleFonts.nunitoSans(
                    fontSize: 24,
                    color: Colors.white70,
                    fontWeight: FontWeight.w700
                  )
                ),
                Text(
                  _subtitle,
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
      ],
    );
  }
}