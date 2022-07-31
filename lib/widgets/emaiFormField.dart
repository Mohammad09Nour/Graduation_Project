import 'package:flutter/material.dart';

import '../constants.dart';

class EmailField extends StatelessWidget {
  final Size size;
  const EmailField({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  Widget getBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizonatlPadding),
      child: TextFormField(
        validator: (val) {
          if (val == null || val.isEmpty) return 'Please enter some text';

          if (val.startsWith('.') ||
              val.endsWith('.') ||
              !val.contains('.') ||
              val.startsWith('@') ||
              val.endsWith('@') ||
              !val.contains('@')) return 'Please enter a valid email';
          return null;
        },
        cursorWidth: 2.5,
        cursorHeight: 24,
        cursorColor: kPrimaryColor,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          disabledBorder: InputBorder.none,
          fillColor: kPrimaryColor.withAlpha(50),
          filled: true,
          hintText: "mohammad@gmail.com",
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 15, right: 10),
            child: Icon(
              Icons.email,
              color: kPrimaryColor,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
    );
  }
}
