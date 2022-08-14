import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/item_info.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:get/get.dart';

const addIcon = Icon(Icons.add);

class CreatePostController extends GetxController {
  var item = ItemInfo("", List.filled(3, Uint8List(0)), "", "", "",
          DateTime(2020), User(items: [], image: Uint8List(0)))
      .obs;
  var attachedImages = List<Widget>.filled(3, addIcon).obs;

  var imageFileList = List.filled(3, Uint8List(0)).obs;

  var titleController = TextEditingController().obs;
  var descrController = TextEditingController().obs;

  String get getTitle => titleController.value.text;
  void setTitle(String val) {
    titleController.value.text = val;
    item.value.title = val;
  }

  String get getDescrobtion => descrController.value.text;
  void setDescribtion(String val) async {
    item.value.descriptions = val;
    descrController.value.text = val;
  }

  List<Uint8List>? get getImageUrls => item.value.imageUrl;
  void setImageUrls() => item.value.imageUrl = getImageUrls;

  void saveImage(int index, var val) {
    if (val == null)
      // ignore: curly_braces_in_flow_control_structures
      attachedImages[index] = addIcon;
    else {
      attachedImages[index] = Image.memory(val);
      item.value.imageUrl![index] = val;
    }
  }

  Widget getAttachedImage(int index) {
    return attachedImages[index];
  }

  bool validate() {
    if (titleController.value.text.isEmpty ||
        descrController.value.text.isEmpty ||
        (attachedImages[0] == addIcon &&
            attachedImages[1] == addIcon &&
            attachedImages[2] == addIcon)) return false;

    return true;
  }

  void clear() {
    titleController.value.text = "";
    descrController.value.text = "";
    item.value = ItemInfo("", List.filled(3, Uint8List(0)), "", "", "",
        DateTime(2020), User(items: [], image: Uint8List(0)));
    attachedImages.value = List<Widget>.filled(3, addIcon);
    imageFileList.value = List.filled(3, Uint8List(0));
  }
}
