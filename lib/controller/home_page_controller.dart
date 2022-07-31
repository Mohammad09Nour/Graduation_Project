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

    tmp.add(ItemInfo("title1", ["images/pp.jpg"], "phoneNumber", "descriptions",
        "images/pp.jpg", DateTime(2020)));

    tmp.add(ItemInfo("title2", ["images/nat.jpg"], "phoneNumber",
        "descriptions", "images/pp.jpg", DateTime(2020)));

    tmp.add(ItemInfo("title3", ["images/nat2.jpg"], "phoneNumber",
        "descriptions", "images/pp.jpg", DateTime(2020)));

    tmp.add(ItemInfo("title4", ["images/nat2.jpg"], "phoneNumber",
        "descriptions", "images/pp.jpg", DateTime(2020)));

    // ignore: invalid_use_of_protected_member
    items.value = tmp;
    print(tmp.length);
  }

  void addItem(ItemInfo item) async {
    await Future.delayed(const Duration(seconds: 1));
    items.add(item);
    print(item);
  }

  int get getSelectedPage => selectedPageIndex.value;
  void setSelectedPage(int index) {
    selectedPageIndex.value = index;
  }
}
