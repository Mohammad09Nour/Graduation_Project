import 'package:flutter_application_1/controller/account_controller.dart';
import 'package:flutter_application_1/models/item_info.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  var items = [].obs;
  var selectedPageIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchItems();
  }

  void fetchItems() async {
    await Future.delayed(const Duration(seconds: 1));

    List<ItemInfo>? tmp = [];
    // ignore: invalid_use_of_protected_member
    tmp = items.value.cast<ItemInfo>();

    /* tmp.add(ItemInfo(
        "Name of what you donate",
        ["images/x.jpg"],
        "+963956816079",
        "some brief descriptions of the item you want to donate and help someone else",
        "images/pp.jpg",
        DateTime(2020)));

    tmp.add(ItemInfo(
        "Name of what you donate",
        ["images/x2.jpg"],
        "+963956816079",
        "some brief descriptions of the item you want to donate and help someone else",
        "images/pro3.jpg",
        DateTime(2020)));

    tmp.add(ItemInfo(
        "Name of what you donate",
        ["images/x3.jpg"],
        "+963956816079",
        "some brief descriptions of the item you want to donate and help someone else",
        "images/pro2.jpg",
        DateTime(2020)));

    tmp.add(ItemInfo(
        "Name of what you donate",
        ["images/x4.jpg"],
        "+963956816079",
        "some brief descriptions of the item you want to donate and help someone else",
        "images/pro1.jpg",
        DateTime(2020)));
*/
    tmp.sort((a, b) {
      return b.createdDate.compareTo(a.createdDate);
    });

    // ignore: invalid_use_of_protected_member
    items.value = tmp;
  }

  void addItem(ItemInfo item) async {
    await Future.delayed(const Duration(seconds: 1));
    items.add(item);
    items.sort((a, b) {
      return b.createdDate.compareTo(a.createdDate);
    });
    var controller = Get.find<AccountController>();

    controller.addItem(item);
  }

  int get getSelectedPage => selectedPageIndex.value;
  void setSelectedPage(int index) {
    selectedPageIndex.value = index;
  }
}
