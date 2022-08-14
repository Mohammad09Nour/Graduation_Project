import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/password_args.dart';
import 'package:flutter_application_1/models/user.dart';

import '../constants/constants.dart';

class PasswordFormField extends StatelessWidget {
  final PasswordArgs args;
  User user;
  PasswordFormField({Key? key, required this.args, required this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  Widget getBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizonatlPadding),
      child: TextFormField(
        textInputAction: TextInputAction.next,
        validator: (val) {
          if (val == null || val.isEmpty) return 'Please enter some text';

          return null;
        },
        obscureText: !args.passwordVisible,
        cursorWidth: 3,
        cursorHeight: 24,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          disabledBorder: InputBorder.none,
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              icon: Icon(
                !args.passwordVisible ? Icons.visibility : Icons.visibility_off,
                color: kPrimaryColor,
              ),
              onPressed: () {
                args.callback();
              },
            ),
          ),

          fillColor: kPrimaryColor.withAlpha(50),
          filled: true,
          hintText: "Password",
          prefixIcon: const Padding(
            padding: EdgeInsets.only(right: 10.0, left: 15),
            child: Icon(
              Icons.lock,
              color: kPrimaryColor,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(30.0),
          ),

          //labelText: "Username",
        ),
      ),
    );
  }
}
