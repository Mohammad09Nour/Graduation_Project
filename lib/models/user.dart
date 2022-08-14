import 'dart:typed_data';

import 'package:flutter_application_1/models/item_info.dart';

class User {
  String name;
  String email;
  Uint8List image;
  String phoneNumber;
  String location;
  List<ItemInfo> items;

  get getName => name;

  get getEmail => email;

  get getImage => image;

  get getPhoneNumber => phoneNumber;
  get getLocation => location;

  get getItems => items;

  User(
      {this.name = "Sliman",
      this.email = "sliman@gmai.com",
      this.phoneNumber = "+963956816079",
      required this.items,
      this.location = "Syria, Homs",
      required this.image});
}
