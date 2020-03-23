import 'package:flutter/material.dart';
import 'package:motel_app/core/models/Motel.dart';
import 'package:motel_app/core/viewmodels/MotelViewModel.dart';
import 'package:provider/provider.dart';

class MotelList extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    final motelProvider = Provider.of<MotelViewModel>(context);
    
    return FutureBuilder(
      future: motelProvider.fetchMotels(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List<Motel> motels = snapshot.data;
          return ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: motels.map((motel) => Column(
              children: <Widget>[
                Container(
                  width: 630,
                  height: 336,
                  padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                  child: Column(
                    children: <Widget>[
                      FittedBox(
                        child: Image.network(motel.photo),
                        fit: BoxFit.fill,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 10,
                            child: Text(motel.motelName, textAlign: TextAlign.left, style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: 'Inter',
                              ),
                            )
                          ),
                          Expanded(
                            flex: 5,
                            child: Text('5.0', textAlign: TextAlign.right, style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14, 
                                fontFamily: 'Inter',
                              )
                            )
                          ),
                        ]
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 5,
                            child: Text('Masaya', textAlign: TextAlign.left, style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                fontFamily: 'Inter',
                              ),
                            )
                          ),
                          Expanded(
                            flex: 5,
                            child: Text('C\$ '+motel.price, textAlign: TextAlign.right, style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                fontFamily: 'Inter',
                              )
                            )
                          ),
                        ],
                      )
                    ],
                  )
                )
              ]
            )).toList()
          );
        } 
        else {
          return Center(child: CircularProgressIndicator());
        } 
      }
    );
  }
}