import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with SingleGetTickerProviderMixin {
  late AnimationController _animationController;
  late Animation<double> animationLogo;
  late Animation<double> animationTextFieldUser;
  final duration = const Duration(milliseconds: 1000);

  @override
  void onInit() {
    _animationController = AnimationController(duration: duration, vsync: this);

    animationLogo = Tween<double>(begin: 0, end: 150)
        .animate(_animationController)
      ..addListener(() => update());
    animationTextFieldUser = Tween<double>(begin: Get.width, end: 0)
        .animate(_animationController)
      ..addListener(() => update());

    _animationController.forward();
    super.onInit();
  }

  @override
  void onClose() {
    _animationController.dispose();
    super.onClose();
  }
}
