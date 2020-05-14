import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:motel_app/core/models/MotelType.dart';
import 'package:motel_app/core/viewmodels/MotelTypeViewModel.dart';
import 'package:motel_app/ui/widgets/Tag.dart';
import 'package:provider/provider.dart';


class MotelDetailScreen extends StatefulWidget{

  final String motelName;
  final String type;
  final String description;
  final String address;
  final GeoPoint location;
  final String photo;
  final String price;

  MotelDetailScreen ({this.motelName, this.type, this.description, this.address, this.location, this.photo, this.price});

  @override
  _MotelDetailScreenState createState() => _MotelDetailScreenState();
}

class _MotelDetailScreenState extends State<MotelDetailScreen> {
  
  @override
  Widget build(BuildContext context) {
    final typeProvider = Provider.of<MotelTypeViewModel>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        width: double.infinity,
        child: FutureBuilder(
          future: typeProvider.getTypeById(widget.type),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              MotelType businessType = snapshot.data;
              return ListView(
                shrinkWrap: false,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(0), bottomRight: Radius.circular(60)),
                        child: Image.network(
                          widget.photo,
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
                      ),
                      Positioned(
                        child: Tag(tag: businessType.type),
                        bottom: 20,
                        left: 20,
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Información de ${businessType.type}",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.blueGrey)
                        ),
                        SizedBox(height: 6),
                        Card(
                          margin: EdgeInsets.symmetric(vertical: 6),
                          elevation: 1,
                          child: Padding(
                            padding: EdgeInsets.all(10),  
                            child: ListTile(
                              leading: Icon(LineIcons.hotel),
                              title: Text('Nombre de ${businessType.type}', style: TextStyle(fontSize: 14),),
                              subtitle: Text(widget.motelName, style: TextStyle(fontSize: 16)),
                            ),
                          ),
                        ),
                        Card(
                          margin: EdgeInsets.symmetric(vertical: 6),
                          elevation: 1,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: ListTile(
                              leading: Icon(LineIcons.file_text),
                              title: Text('Descripción', style: TextStyle(fontSize: 14),),
                              subtitle: Text(widget.description, style: TextStyle(fontSize: 16)),
                            ),
                          ),
                        ),
                        Card(
                          margin: EdgeInsets.symmetric(vertical: 6),
                          elevation: 1,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: ListTile(
                              leading: Icon(LineIcons.location_arrow),
                              title: Text('Dirección', style: TextStyle(fontSize: 14),),
                              subtitle: Text(widget.address, style: TextStyle(fontSize: 16)),
                            ),
                          ),
                        ),
                        Card(
                          margin: EdgeInsets.symmetric(vertical: 6),
                          elevation: 1,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: ListTile(
                              leading: Icon(Icons.map),
                              title: Text('Coordenadas', style: TextStyle(fontSize: 14),),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Latitud: ${widget.location.latitude.toString()}", style: TextStyle(fontSize: 16)),
                                  Text("Longitud: ${widget.location.longitude.toString()}", style: TextStyle(fontSize: 16))
                                ],
                              )
                            ),
                          ),
                        ),
                        Card(
                          margin: EdgeInsets.symmetric(vertical: 6),
                          elevation: 1,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: ListTile(
                              leading: Icon(Icons.monetization_on),
                              title: Text('Precio', style: TextStyle(fontSize: 14),),
                              subtitle: Text(widget.price, style: TextStyle(fontSize: 16)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            }
            return Padding(
              padding: EdgeInsets.all(20),
              child: Center(
                  child: CircularProgressIndicator(),
              ),
            );
          }
        )
      ),
    );
  }
}