// ignore_for_file: must_be_immutable

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/account_controller.dart';
import 'package:flutter_application_1/controller/create_post_controller.dart';
import 'package:flutter_application_1/controller/home_page_controller.dart';
import 'package:flutter_application_1/models/item_info.dart';
import 'package:flutter_application_1/views/home_page.dart';
import 'package:get/get.dart';
import 'package:image_picker_web/image_picker_web.dart';

class CreatePost extends StatelessWidget {
  List<Uint8List>? imageFileList = List.filled(3, Uint8List(0));

  var titleController = TextEditingController();
  CreatePost({Key? key}) : super(key: key);

  Future<Uint8List?> selectImages(int index) async {
    final selectedImages = await ImagePickerWeb.getImageAsBytes();

    return selectedImages;
  }

  final conn = Get.put(CreatePostController());
  final homeContr = Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {
    return GetX<CreatePostController>(builder: (controller) {
      return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/createPostBG.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.3)),
                width: MediaQuery.of(context).size.width / 1.2,
                height: MediaQuery.of(context).size.height / 1.2,
                child: ListView(
                  children: [
                    header(),
                    titleField(controller),
                    const SizedBox(height: 20),
                    descriptionField(controller),
                    const SizedBox(height: 20),
                    Container(
                      width: MediaQuery.of(context).size.width / 2.6,
                      color: Colors.white70.withOpacity(0.4),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Attch photos (max 3)",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.8),
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              getAttachImage(0, context, controller),
                              getAttachImage(1, context, controller),
                            ],
                          ),
                          Center(
                            child: getAttachImage(2, context, controller),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              donateButton(context, controller)
            ],
          ),
        ),
      );
    });
  }

  Row titleField(CreatePostController controller) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              // controller: titleController,
              controller: controller.titleController.value,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[800]),
                hintText: "Title",
                fillColor: Colors.white70,
                //  errorText: controller.titlError.value,
              ),
            ),
          ),
        ),
        //  Expanded(child: CategoriesDropDown()),
      ],
    );
  }

  Padding descriptionField(CreatePostController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        controller: controller.descrController.value,
        maxLines: 6,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          filled: true,
          hintText: "Describe your donation",
          fillColor: Colors.white70,

          // errorText: controller.descError,
        ),
      ),
    );
  }

  Row donateButton(BuildContext context, CreatePostController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: 15, right: MediaQuery.of(context).size.width / 10),
          child: Container(
            width: 140,
            height: 30,
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [
                Color.fromARGB(255, 193, 63, 245),
                Color.fromARGB(255, 143, 26, 221)
              ]),
              borderRadius: BorderRadius.circular(30),
            ),
            child: ElevatedButton(
              onPressed: () async {
                // ignore: unnecessary_null_comparison
                if (controller.validate()) {
                  await confirmDialog(context, controller);
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
              child: const Text(
                "DONATE NOW",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }

  Padding header() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Center(
        child: Text(
          "WE ARE THANKFUL FOR YOUR HELP",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.green, fontSize: 18),
        ),
      ),
    );
  }

  Widget getAttachImage(
      int index, BuildContext context, CreatePostController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Container(
        color: Color.fromARGB(147, 153, 145, 37),
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

  confirmDialog(BuildContext context, CreatePostController controller) {
    var account = Get.find<AccountController>();
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Are you sure?"),
            content: const Text(
                "Are you sure to publish this and make some help to other ?"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
                child: const Text(
                  "NO",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {
                  controller.setImageUrls();
                  homeContr.addItem(
                    ItemInfo(
                        controller.getTitle,
                        controller.getImageUrls,
                        "+963956816079",
                        controller.getDescrobtion,
                        "account.user.value.image",
                        DateTime.now(),
                        account.user.value),
                  );
                  Navigator.pop(context);
                  homeContr.setSelectedPage(0);
                  controller.clear();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green[400]),
                ),
                child: const Text(
                  "YES",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          );
        });
  }
}
