import 'package:flutter/material.dart';

class Tag extends StatelessWidget {

  final String tag;

  Tag({this.tag});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(245,255,255, 1),
        borderRadius: BorderRadius.all(Radius.circular(50))
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
        child: Wrap(
          children: <Widget>[
            Center(
              child: Text(tag, style: TextStyle(fontSize: 14),),
            )
          ],
        ),
      ),
    );
  }
}