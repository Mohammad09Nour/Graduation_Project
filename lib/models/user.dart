import 'package:flutter_application_1/models/item_info.dart';

class User {
  String name;
  String email;
  String image;
  String phoneNumber;
  List<ItemInfo> items;

  get getName => name;

  get getEmail => email;

  get getImage => image;

  get getPhoneNumber => phoneNumber;

  get getItems => items;

  User(
      {this.name = "Sliman",
      this.email = "sliman@gmai.com",
      this.image = "images/p.jpg",
      this.phoneNumber = "+963956816079",
      this.items = const []});
}
