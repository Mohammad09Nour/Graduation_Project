import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constants.dart';

class UserName extends StatelessWidget {
  const UserName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizonatlPadding),
      child: TextFormField(
        validator: (val) {
          if (val == null || val.isEmpty) return 'Please Enter some text';
          return null;
        },
        cursorWidth: 2.5,
        cursorHeight: 24,
        cursorColor: kPrimaryColor,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          disabledBorder: InputBorder.none,
          fillColor: kPrimaryColor.withAlpha(50),
          filled: true,
          hintText: 'Username',
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 15, right: 10),
            child: Icon(
              Icons.person_rounded,
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
}
