import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constants.dart';
import 'package:flutter_application_1/controller/account_controller.dart';
import 'package:flutter_application_1/controller/profile_controller.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:get/get.dart';

import 'package:image_picker_web/image_picker_web.dart';

class EditPersonalInfo extends StatelessWidget {
  bool isObscurePass = false;

  Future<Uint8List?> selectImages() async {
    final selectedImages = await ImagePickerWeb.getImageAsBytes();

    return selectedImages;
  }

  final controller = Get.find<AccountController>();
  late User user;
  //final ProfileController controller;
  EditPersonalInfo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    user = controller.user.value;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit"),
        backgroundColor: kPrimaryColor,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(children: [
            Obx(
              () => GestureDetector(
                onTap: () async {
                  var newImg = await selectImages();
                  controller.updatProfilePic(newImg!);
                },
                child: Center(
                  child: Stack(children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1))
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: MemoryImage(controller.user.value.image),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 4,
                              ),
                              color: kPrimaryColor),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )),
                    const SizedBox(
                      height: 30,
                    )
                  ]),
                ),
              ),
            ),
            buildTextField("UserName", "Demo", false),
            buildTextField("Email", "Demo#gmail.com", false),
            buildTextField("Password", "******", true),
            buildTextField("Location", "Homs", false),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: OutlinedButton(
                    onPressed: () {
                      // controller.clear();
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      "CANCEL",
                      style: TextStyle(
                          fontSize: 15, letterSpacing: 2, color: Colors.black),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: ElevatedButton(
                    onPressed: () {
                      controller.editInfo(user);
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: kPrimaryColor,
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      "SAVE",
                      style: TextStyle(
                          fontSize: 15, letterSpacing: 2, color: Colors.white),
                    ),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }

  Widget buildTextField(
      String lableText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: TextField(
        onChanged: ((value) {
          if (lableText == "UserName") {
            user.name = value;
          } else if (lableText == "Email") {
            user.email = value;
          } else if (lableText == "Password") {
          } else {
            user.location = value;
          }
        }),
        obscureText: isPasswordTextField ? isObscurePass : false,
        decoration: InputDecoration(
          suffix: isPasswordTextField
              ? IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.remove_red_eye,
                    color: Colors.grey,
                  ),
                )
              : null,
          contentPadding: const EdgeInsets.only(bottom: 5),
          labelText: lableText,
          labelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
      ),
    );
  }
}
