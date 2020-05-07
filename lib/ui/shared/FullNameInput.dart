import 'package:flutter/material.dart';

class FullNameInpunt extends StatefulWidget {
  FullNameInpunt({Key key}) : super(key: key);

  @override
  _FullNameInpuntState createState() => _FullNameInpuntState();
}

class _FullNameInpuntState extends State<FullNameInpunt> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
         )
       ),
     ],
      );
  }
}