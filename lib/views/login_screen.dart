import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/constants/constants.dart';
import 'package:flutter_application_1/controller/account_controller.dart';
import 'package:flutter_application_1/models/password_args.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/views/RegisterPage.dart';
import 'package:flutter_application_1/views/home_page.dart';
import 'package:flutter_application_1/widgets/do_you_have_an.dart';
import 'package:flutter_application_1/widgets/passwordFormField.dart';
import 'package:flutter_application_1/widgets/submit_button.dart';
import 'package:flutter_application_1/widgets/username_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final controller = Get.put(AccountController);
  bool isLogin = true;
  late Animation<double> containerSize;
  late AnimationController animationController;
  Duration animationDuration = const Duration(milliseconds: 270);
  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: animationDuration);
    var con = Get.put(AccountController());

    con.setDefaultProfilePic();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  final _loginKey = GlobalKey<FormState>();
  final _regKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double viewInsets = MediaQuery.of(context).viewInsets.bottom;
    double defaultLoginSize = size.height - (size.height * 0.2);
    double defaultRegisterSize = size.height - (size.height * 0.1);

    containerSize = Tween<double>(
            begin: size.height * 0.1, end: defaultRegisterSize)
        .animate(
            CurvedAnimation(parent: animationController, curve: Curves.linear));

    User user = User(items: [], image: Uint8List(0));
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Stack(
          children: [
            getRightCircel(),
            getLeftCircel(),
            closeButton(size),
            AnimatedOpacity(
              opacity: isLogin ? 1.0 : 0.0,
              duration: animationDuration * 4,
              child: Align(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: size.width,
                    height: defaultLoginSize,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Wlecome Back",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 40),
                        getPic(size),
                        const SizedBox(height: 40),
                        Form(
                            key: _loginKey,
                            child: Column(
                              children: [
                                UserName(
                                  user: user,
                                ),
                                const SizedBox(height: 10),
                                PasswordFormField(
                                  user: User(items: [], image: Uint8List(0)),
                                  args: PasswordArgs(
                                    size: size,
                                    callback: () {
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                    passwordVisible: _passwordVisible,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                SubmitButton(
                                  text: "LOGIN",
                                  size: size,
                                  callbackValidator: () {
                                    if (_loginKey.currentState!.validate()) {
                                      var controller =
                                          Get.find<AccountController>();
                                      controller.logIn(user);

                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomePage()));
                                    }
                                  },
                                ),
                                const SizedBox(height: 10),
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            DoYouHaveAnAccount(
                viewInsets: viewInsets,
                animationController: animationController,
                isLogin: isLogin,
                callback: () {
                  setState(() {
                    isLogin = !isLogin;
                  });
                },
                containerSize: containerSize),
            RegisterPage(
              formKey: _regKey,
              isLogin: isLogin,
              animationDuration: animationDuration,
              defaultLoginSize: defaultLoginSize,
              passArgs: PasswordArgs(
                size: size,
                callback: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
                passwordVisible: _passwordVisible,
              ),
            )
          ],
        ),
      ),
    );
    ;
  }

  SizedBox getPic(Size size) {
    return SizedBox(
      width: size.width * 0.8,
      height: size.height * 0.2,
      child: SvgPicture.asset('images/register.svg'),
    );
  }

  Positioned getLeftCircel() {
    return Positioned(
      top: -50,
      left: -50,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(110),
          color: kPrimaryColor,
        ),
      ),
    );
  }

  Positioned getRightCircel() {
    return Positioned(
      top: 50,
      right: -50,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: kPrimaryColor,
        ),
      ),
    );
  }

  AnimatedOpacity closeButton(Size size) {
    return AnimatedOpacity(
      opacity: isLogin ? 0.0 : 1.0,
      duration: animationDuration,
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: size.height * 0.1,
          width: size.width,
          alignment: Alignment.bottomCenter,
          child: !isLogin
              ? IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    animationController.reverse();
                    setState(() {
                      isLogin = !isLogin;
                    });
                  },
                  color: kPrimaryColor,
                )
              : Container(),
        ),
      ),
    );
  }
}
