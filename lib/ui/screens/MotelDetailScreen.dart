import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';


class MotelDetailScreen extends StatelessWidget{

  String motelName;
  String description;
  String address;
  GeoPoint location;
  String photo;
  String price;

  MotelDetailScreen ({this.motelName, this.description, this.address, this.location, this.photo, this.price});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: Container(
        width: double.infinity,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(0), bottomRight: Radius.circular(60)),
                  child: Image.network(
                    photo,
                    height: 400,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color.fromRGBO(255, 255, 255, .7),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.blueGrey,), 
                      onPressed: () => Navigator.of(context).pop()
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Información de motel",
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.blueGrey
                      )
                    ),
                    SizedBox(height: 6),
                    Card(
                      margin: EdgeInsets.symmetric(vertical: 6),
                      elevation: 1,
                      child: ListTile(
                        leading: Icon(LineIcons.hotel),
                        title: Text('Nombre de motel', style: TextStyle(fontSize: 14),),
                        subtitle: Text(motelName, style: TextStyle(fontSize: 16)),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(vertical: 6),
                      elevation: 1,
                      child: ListTile(
                        leading: Icon(LineIcons.file_text),
                        title: Text('Descripción', style: TextStyle(fontSize: 14),),
                        subtitle: Text(description, style: TextStyle(fontSize: 16)),
                        isThreeLine: true,
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(vertical: 6),
                      elevation: 1,
                      child: ListTile(
                        leading: Icon(LineIcons.location_arrow),
                        title: Text('Dirección', style: TextStyle(fontSize: 14),),
                        subtitle: Text(address, style: TextStyle(fontSize: 16)),
                        isThreeLine: true,
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(vertical: 6),
                      elevation: 1,
                      child: ListTile(
                        leading: Icon(Icons.map),
                        title: Text('Coordenadas', style: TextStyle(fontSize: 14),),
                        subtitle: Text("Latitud: ${location.latitude.toString()}\nLongitud: ${location.longitude.toString()}\n", style: TextStyle(fontSize: 16)),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(vertical: 6),
                      elevation: 1,
                      child: ListTile(
                        leading: Icon(Icons.monetization_on),
                        title: Text('Precio por hora', style: TextStyle(fontSize: 14),),
                        subtitle: Text(price, style: TextStyle(fontSize: 16)),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}