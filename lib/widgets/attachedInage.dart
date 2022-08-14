import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/controller/create_post_controller.dart';
import 'package:image_picker_web/image_picker_web.dart';

class AttachedImage extends StatelessWidget {
  int index;
  BuildContext context;
  CreatePostController controller;
  AttachedImage(
      {Key? key,
      required this.context,
      required this.controller,
      required this.index})
      : super(key: key);

  Future<Uint8List?> selectImages(int index) async {
    final selectedImages = await ImagePickerWeb.getImageAsBytes();

    return selectedImages;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Container(
        color: Colors.white70,
        width: MediaQuery.of(context).size.width / 3,
        height: 125,
        child: GestureDetector(
          onTap: () async {
            selectImages(index).then((value) {
              if (value != null) {
                controller.saveImage(index, value);
              } else {
                controller.saveImage(index, value);
              }
            });
          },
          child: controller.getAttachedImage(index),
        ),
      ),
    );
  }
}
