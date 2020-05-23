import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:motel_app/core/models/Ubicacion.dart';
import 'package:motel_app/core/services/location_service.dart';
import 'package:motel_app/icons/icons_motel_icons.dart';
import 'package:provider/provider.dart';

import 'package:motel_app/core/viewmodels/MotelViewModel.dart';
import 'package:motel_app/core/models/Motel.dart';
import 'package:motel_app/ui/shared/InformacionMotelDialog.dart';

class MapScreen extends StatefulWidget {

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  
  final mapController = MapController();
  String idMap = 'streets';
  LocationService locationServ = new LocationService();
  Ubicacion ubicacionUsuario;
  Future<Ubicacion> ubicacionAhora; 
  
  //para medir las distancias
  Distance distancia = new Distance();
  List<LatLng> distanciaMarcador = [];

  @override
  void initState() {
    
    super.initState();

    //al iniciar el app obtener la ubicacion del user y ponerlo en el objeto ubicacionUsuario
    ubicacionAhora = ponerUbicacion();
        
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: obtenerInfoMapa(),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
         _creatBotonVista(),
         _crearBotones(),
        ],
        
      ),
     

      );
  }

  //creamos el futurebuilder que trae la info de la ubicacion de los marcadores
  Widget obtenerInfoMapa() {

    final motelProvider = Provider.of<MotelViewModel>(context);

    return FutureBuilder(
      future: motelProvider.fetchMotels(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {

          List<Motel> motels = snapshot.data;
          _llenarListaDist(motels);
          print(snapshot.data);
          return _crearFlutterMapa(motels, context);

        } 
        return Center(child: CircularProgressIndicator());
      },    
    );

  }
  
  //Creamos el contenedor donde se añadirán el mapa y los marcadores
  Widget _crearFlutterMapa(List<Motel> data, BuildContext context) {

    return FutureBuilder(
      future : ubicacionAhora,
      builder: (BuildContext context, AsyncSnapshot snapshot) {

        if(snapshot.connectionState == ConnectionState.done) {
          
          ubicacionUsuario = snapshot.data;

           return FlutterMap(
            mapController: mapController,
            options: MapOptions(
              center: LatLng(ubicacionUsuario.latitud, ubicacionUsuario.longitud),
              zoom: 15.0,
            ),

            layers: [
              _crearMapa(),
              _crearMarcadorUsuario(),
              _crearMarcadores(data),
            ],
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }


      });
   
  }

  //Creamos el mapa y le especificamos el estilo que tendrá
   TileLayerOptions _crearMapa( ) {

     return TileLayerOptions(
       urlTemplate: 'https://api.tiles.mapbox.com/v4/'
              '{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}',
       additionalOptions: {
         'accessToken' : 'pk.eyJ1IjoidmljdG9yYWJ1ZCIsImEiOiJjazg2cnB6Y2gwaDBhM2xrbDdtMzZiZDB5In0.lkL45BZCP67wu77nApwdsg',
         'id' : 'mapbox.$idMap',
       }
            
     );
  }

   MarkerLayerOptions _crearMarcadorUsuario() {

     return MarkerLayerOptions(

       markers: [
         Marker(
          width: 24.0,
          height: 24.0,
          point: new LatLng( ubicacionUsuario.latitud, ubicacionUsuario.longitud ),
          builder: (context) =>  Container(
            child: Icon(Icons.location_on, color: Colors.red, size: 30,),

          ),
         )
       ],
     );
  }

  MarkerLayerOptions _crearMarcadores(List<Motel> data) {

     return MarkerLayerOptions(

       markers: data.map((motel) => Marker(

         width: 24.0,
         height: 24.0,
         point: new LatLng(motel.location.latitude, motel.location.longitude),
         
         builder: (context) =>  Container(
           child: IconButton(
             icon: agregarIcono(motel.typeId), 
             color: agregarColor(motel.typeId),
             onPressed: () {
               verInfoMotel(motel, context);
             },
             ),
           
         )
       ),
            
      ).toList(),
     );
  }

  Icon agregarIcono (String idIcono) {
    //en dependencia del id del tipo retorna un tipo de icono
    idIcono = idIcono.replaceAll(" ", "");
    
    switch (idIcono) {

      case "2bPekbxw39uodioQMDA4" :
        return Icon(
          IconsMotel.automotel_icon
        );
        break;

      case "KLrSvMIukdWqiT5kw1if" :
        return Icon(
          IconsMotel.motel_icon
        );
        break;

      case "tWMYlPIqW7MmfWuk5qm9" :
        return Icon(
          IconsMotel.hotel_icon
        );
        break;
      
      case "wVhv7qU3ao2mu2wWYJMw" :
        return Icon(
          IconsMotel.automotel_icon
        );
        break;

      default: 
        return Icon(
          Icons.airline_seat_flat
        );
    }
  }

  
  Color agregarColor (String idIcono) {
    //en dependencia del id del tipo retorna un tipo de icono
    idIcono = idIcono.replaceAll(" ", "");
    
    switch (idIcono) {

      case "2bPekbxw39uodioQMDA4" :
        return Color.fromARGB(255, 152, 24, 214);
        break;

      case "KLrSvMIukdWqiT5kw1if" :
        return Color.fromARGB(255, 255, 81, 81);
        break;

      case "tWMYlPIqW7MmfWuk5qm9" :
        return Color.fromARGB(255, 255, 164, 27);
        break;
      
      case "wVhv7qU3ao2mu2wWYJMw" :
        return Color.fromARGB(255, 152, 24, 214);
        break;

      default: 
        return Colors.red;

        break;
    }
  }


  Widget _crearBotones() {

     return ( 
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Column( 
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: 40.0,
                  padding: EdgeInsets.only(bottom: 5),
                  child:  FloatingActionButton(
                    child: Icon(Icons.location_searching),
                    onPressed: irUbicacionUsuario,
                    ),
                    ),
                FloatingActionButton(
                    backgroundColor: Colors.red,
                    child: Icon(Icons.send),
                    onPressed: () {_irMotelMasCercano();},),
              ],
            ),
      

          ],
        )
      
     );
  
  }

  void irUbicacionUsuario() async{

    ubicacionUsuario = await locationServ.getLocaton();
    
    mapController.move(
      LatLng(ubicacionUsuario.latitud, ubicacionUsuario.longitud),
      15
       );
  }

    Future<Ubicacion> ponerUbicacion() async{

    Ubicacion ubicacion = await locationServ.getLocaton();

     return ubicacion;

  }
  //botón izquierfa
  Widget _creatBotonVista() {
    
     return ( 
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[

            Row( 
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(right: 250),
                  child: FloatingActionButton(
                      backgroundColor: Colors.blue[600],
                      child: Icon(Icons.repeat),
                      onPressed: () {cambiarEstiloMapa();},),
                ),
       
              ],
            ),
          ],
        )
      
     );
  }

  void cambiarEstiloMapa() {

    if(idMap == 'streets') {
      idMap = 'dark';
    } else if(idMap == 'dark') {
      idMap = 'light';
    } else if(idMap == 'light') {
       idMap = 'outdoors';
    } else if(idMap == 'outdoors'){
      idMap = 'satellite';
    } else {
      idMap = 'streets';
    } 

    setState(() {});

  }


/*
final Distance distance = new Distance();
    
    // km = 423
    final int km = distance.as(LengthUnit.Kilometer,
     new LatLng(52.518611,13.408056),new LatLng(51.519475,7.46694444));
    
    // meter = 422591.551
    final int meter = distance(
        new LatLng(52.518611,13.408056),
        new LatLng(51.519475,7.46694444)
        );
*/
  void _llenarListaDist(List<Motel> lista) {
    
    for(int i = 0; i < lista.length; i++){

      distanciaMarcador.add(new LatLng(lista[i].location.latitude, lista[i].location.longitude));
    }
  }

  void _irMotelMasCercano() {

    List<double> distanciaKM = [];
    double menor = 0;
    int posicionMenor = 0;

    for(int i = 0; i < distanciaMarcador.length; i++) {
      //en cada posicion almacena la distancia en kilometros de cada marcador al usuario
      distanciaKM.add(
        distancia.as(LengthUnit.Kilometer,
          new LatLng(ubicacionUsuario.latitud, ubicacionUsuario.longitud),
          new LatLng(distanciaMarcador[i].latitude, distanciaMarcador[i].longitude)
        )
        );
 
    }
    for(int i = 0 ; i < distanciaKM.length; i++ ) {

      if(i == 0) {

        menor = distanciaKM[0];
        posicionMenor = i;
      }else{
        if(distanciaKM[i] < menor) {

          menor = distanciaKM[i];
           posicionMenor = i;
        }
      }
    }

     mapController.move(
      LatLng(distanciaMarcador[posicionMenor].latitude, distanciaMarcador[posicionMenor].longitude),
      15
       );


  }


}