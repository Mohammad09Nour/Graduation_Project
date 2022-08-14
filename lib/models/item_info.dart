import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/models/user.dart';

class ItemInfo {
  User user;
  String title;
  List<Uint8List>? imageUrl;
  String phoneNumber;
  String descriptions;
  String urlProfileImage;

  DateTime createdDate = DateTime(2020);
  ItemInfo(this.title, this.imageUrl, this.phoneNumber, this.descriptions,
      this.urlProfileImage, this.createdDate, this.user);
}
