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
            children: motels.map((motel) => ListTile(title: Text(motel.motelName), subtitle: Text(motel.description))).toList()
          );
        } 
        else {
          return Center(child: CircularProgressIndicator());
        } 
      }
    );
  }
}