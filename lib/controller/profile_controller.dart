import 'package:flutter_application_1/models/item_info.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var items = [].obs;
  var user = User(items: [
    ItemInfo("title", ["images/x.jpg"], "+963956816079", "descriptions",
        "images/nat2.jpg", DateTime.now()),
    ItemInfo("title", ["images/x4.jpg"], "+963956816079", "descriptions",
        "images/nat2.jpg", DateTime.now()),
    ItemInfo("title", ["images/x5.jpg"], "+963956816079", "descriptions",
        "images/nat3.jpg", DateTime.now()),
    ItemInfo("title", ["images/x2.jpg"], "+963956816079", "descriptions",
        "images/nat.jpg", DateTime.now())
  ]).obs;

  @override
  void onInit() {
    super.onInit();
    fetchItems();
  }

  fetchItems() async {
    await Future.delayed(const Duration(seconds: 1));
    items.add(ItemInfo("tit", ["images/pic.jpg"], "+963956816079",
        "descriptions", "images/pp.jpg", DateTime.now()));

    items.add(ItemInfo("tit", ["images/pic.jpg"], "+963956816079",
        "descriptions", "images/pp.jpg", DateTime.now()));
    items.add(ItemInfo("tit", ["images/nat.jpg"], "+963956816079",
        "descriptions", "images/pp.jpg", DateTime.now()));

    items.add(ItemInfo("tit", ["images/pp.jpg"], "+963956816079",
        "descriptions", "images/pp.jpg", DateTime.now()));

    // ignore: invalid_use_of_protected_member
    // user.value.items = items.value as List<ItemInfo>;
  }

  editUserInfo(User usr) {}
  clear() {}
}
