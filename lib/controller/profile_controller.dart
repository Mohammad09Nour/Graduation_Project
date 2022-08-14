import 'dart:typed_data';

import 'package:flutter_application_1/models/item_info.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var items = [].obs;
  var user = User(items: [], image: Uint8List(0)).obs;

  @override
  void onInit() {
    super.onInit();
    fetchItems();
  }

  fetchItems() async {
    await Future.delayed(const Duration(seconds: 1));
    /*items.add(ItemInfo("tit", ["images/pic.jpg"], "+963956816079",
        "descriptions", "images/pp.jpg", DateTime.now()));

    items.add(ItemInfo("tit", ["images/pic.jpg"], "+963956816079",
        "descriptions", "images/pp.jpg", DateTime.now()));
    items.add(ItemInfo("tit", ["images/nat.jpg"], "+963956816079",
        "descriptions", "images/pp.jpg", DateTime.now()));

    items.add(ItemInfo("tit", ["images/pp.jpg"], "+963956816079",
        "descriptions", "images/pp.jpg", DateTime.now()));

    // ignore: invalid_use_of_protected_member
    // user.value.items = items.value as List<ItemInfo>;*/
  }

  save() {}

  clear() {}
}
