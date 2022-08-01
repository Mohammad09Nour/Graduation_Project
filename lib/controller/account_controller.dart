import 'package:flutter_application_1/models/user.dart';
import 'package:get/get.dart';

class AccountController extends GetxController {
  // ignore: prefer_final_fields
  bool _isLogIn = false;
  var user = User();
  bool isLoggingIn() => _isLogIn;

  logIn(String email, String pass) {
    user.email = "HIO@gmail.com";
    _isLogIn = true;
  }

  resgister(User usr) {
    user = usr;
  }
}
