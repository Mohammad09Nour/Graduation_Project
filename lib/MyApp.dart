// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/account_controller.dart';
import 'package:flutter_application_1/views/login_screen.dart' show LoginScreen;

import 'package:flutter/gestures.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //   Get.put(AccountController());
    return GetMaterialApp(
        scrollBehavior: MyCustomScrollBehavior(),
        debugShowCheckedModeBanner: false,
        title: "ff",
        home: const LoginScreen());
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
