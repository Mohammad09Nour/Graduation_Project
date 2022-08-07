import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/password_args.dart';
import 'package:flutter_application_1/views/home_page.dart';
import 'package:flutter_application_1/widgets/emaiFormField.dart';
import 'package:flutter_application_1/widgets/passwordFormField.dart';
import 'package:flutter_application_1/widgets/submit_button.dart';
import 'package:flutter_application_1/widgets/username_text_field.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/constants.dart';

class RegisterPage extends StatelessWidget {
  final bool isLogin;
  final Duration animationDuration;
  final double defaultLoginSize;
  final PasswordArgs passArgs;
  final formKey;

  const RegisterPage({
    Key? key,
    required this.isLogin,
    required this.passArgs,
    required this.animationDuration,
    required this.defaultLoginSize,
    required this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getBody(context, formKey);
  }

  AnimatedOpacity getBody(context, formKey) {
    return AnimatedOpacity(
      opacity: isLogin ? 0.0 : 1.0,
      duration: animationDuration * 5,
      child: Visibility(
        visible: !isLogin,
        child: Align(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Container(
              width: passArgs.size.width,
              height: defaultLoginSize,
              child: ListView(
                //    crossAxisAlignment: CrossAxisAlignment.center,
                //  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Center(
                      child: Text(
                        "Wlecome",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  getPic(),
                  const SizedBox(height: 40),
                  Form(
                      key: formKey,
                      child: Column(
                        children: [
                          const UserName(),
                          const SizedBox(height: 10),
                          EmailField(size: passArgs.size),
                          const SizedBox(height: 10),
                          PasswordFormField(args: passArgs),
                          const SizedBox(height: 10),
                          getPhoneNumber(),
                          const SizedBox(height: 10),
                          SubmitButton(
                              text: "SIGN UP",
                              size: passArgs.size,
                              callbackValidator: () async {
                                if (formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Processing Data'),
                                      action: SnackBarAction(
                                        label: 'Hide',
                                        onPressed: () {
                                          ScaffoldMessenger.of(context)
                                              .hideCurrentSnackBar();
                                        },
                                      ),
                                      duration: Duration(seconds: 3),
                                    ),
                                  );
                                  await Future.delayed(Duration(seconds: 3));
                                  //  Navigator.pop(context);
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage()));
                                }
                              }),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding getPhoneNumber() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizonatlPadding),
      child: TextFormField(
        validator: (val) {
          if (val == null || val.isEmpty) return 'Please Enter some text';

          if (!val.startsWith('+963') || val.length != 13) {
            return 'Please enter a valid number';
          }
          return null;
        },
        cursorWidth: 2.5,
        cursorHeight: 24,
        cursorColor: kPrimaryColor,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          disabledBorder: InputBorder.none,
          fillColor: kPrimaryColor.withAlpha(50),
          filled: true,
          hintText: 'Phone Number',
          prefixIcon: const Padding(
            padding: EdgeInsets.only(left: 15, right: 10),
            child: Icon(
              Icons.phone,
              color: kPrimaryColor,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  SizedBox getPic() {
    return SizedBox(
      width: passArgs.size.width * 0.8,
      height: passArgs.size.height * 0.2,
      child: SvgPicture.asset('images/register.svg'),
    );
  }
}
