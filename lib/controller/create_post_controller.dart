import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/item_info.dart';
import 'package:get/get.dart';

const addIcon = Icon(Icons.add);

class CreatePostController extends GetxController {
  var item = ItemInfo("", [], "", "", "", DateTime(2020)).obs;
  var attachedImages = List<Widget>.filled(3, addIcon).obs;

  var imageFileList = List.filled(3, Uint8List(0)).obs;

  var titleController = TextEditingController().obs;
  var descrController = TextEditingController().obs;

  String get getTitle => titleController.value.text;
  void setTitle(String val) {
    titleController.value.text = val;
    //item.value.title = val;
  }

  String get getDescrobtion => descrController.value.text;
  void setDescribtion(String val) async {
    // item.value.descriptions = val;
    descrController.value.text = val;
  }

  List<String> get getImageUrls => item.value.imageUrl;
  void setImageUrls(List<String> val) => item.value.imageUrl = val;

  void saveImage(int index, var val) {
    if (val == null)
      // ignore: curly_braces_in_flow_control_structures
      attachedImages[index] = addIcon;
    else {
      print(index);
      attachedImages[index] = val;
    }
  }

  Widget getAttachedImage(int index) {
    return attachedImages[index];
  }

  void clear() {
    titleController.value.text = "";
    descrController.value.text = "";
    item.value = ItemInfo("", [], "", "", "", DateTime(2020));
    attachedImages.value = List<Widget>.filled(3, addIcon);
    imageFileList.value = List.filled(3, Uint8List(0));
  }
}
