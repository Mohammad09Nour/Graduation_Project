import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/item_info.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:get/get.dart';

class AccountController extends GetxController {
  // ignore: prefer_final_fields

  late Uint8List defaultProfilePic;
  bool _isLogIn = false;
  var user = User(items: [], image: Uint8List(0)).obs;
  bool isLoggingIn() => _isLogIn;

  setDefaultProfilePic() async {
    final ByteData bytes = await rootBundle.load('images/p.jpg');
    final Uint8List img = bytes.buffer.asUint8List();
    defaultProfilePic = img;
    user.value.image = defaultProfilePic;
  }

  logIn(User loggedUser) {
    var usr = user.value;
    usr.email = loggedUser.email;
    usr.name = loggedUser.name;
    user.value = usr;
    user.refresh();
    _isLogIn = true;
  }

  register(User usr) {
    user.value = usr;
    user.refresh();
  }

  editInfo(User usr) {
    user.value.name = usr.name;
    user.refresh();
  }

  deletItem(ItemInfo item) {
    user.value.items.remove(item);
    user.refresh();
  }

  addItem(ItemInfo item) {
    user.value.items.add(item);
    user.refresh();
  }

  updatProfilePic(Uint8List img) {
    user.value.image = img;
    user.refresh();
  }
}
