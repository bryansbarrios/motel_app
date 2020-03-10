import 'package:cloud_firestore/cloud_firestore.dart';

class Motel {
  String id;
  String typeId;
  String motelName;
  String description;
  String address;
  GeoPoint location;
  String photo;
  String availableServices;
  String price;

  Motel ({this.typeId, this.motelName, this.description, this.address, this.location, this.photo, this.availableServices, this.price});

  Motel.fromMap(Map data, String id):
    id = id ?? '',
    typeId = data ['typeId'] ?? '',
    motelName = data ['motelName'] ?? '',
    description = data ['description'] ?? '',
    address = data ['address'] ?? '',
    location = data ['location'],
    photo = data ['photo'] ?? '',
    availableServices = data ['available_services'] ?? '',
    price = data ['price'] ?? '';
}
