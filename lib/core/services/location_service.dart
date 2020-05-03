import 'dart:async';
import 'package:location/location.dart';
import 'package:latlong/latlong.dart';

import 'package:motel_app/core/models/Ubicacion.dart';

class LocationService {

  Ubicacion _locacionAhora;

  var locacion = Location();

  Future<Ubicacion> getLocaton() async{

    try {
      
      var locacionUsuario = await locacion.getLocation();

      _locacionAhora = Ubicacion(
        latitud: locacionUsuario.latitude,
        longitud: locacionUsuario.longitude,
        
        );

    }catch(e) {

      print('No se obtuvo la locación');

      
    }
  
    return _locacionAhora;

  }
}