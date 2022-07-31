import 'package:flutter/material.dart';

import '../constants.dart';

class SubmitButton extends StatelessWidget {
  final String text;
  final Size size;
  final void Function() callbackValidator;
  const SubmitButton(
      {Key? key,
      required this.text,
      required this.size,
      required this.callbackValidator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getBody(context);
  }

  InkWell getBody(context) {
    return InkWell(
      onTap: () {
        callbackValidator();
      },
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: size.width * 0.6,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: kPrimaryColor,
        ),
        padding: EdgeInsets.symmetric(vertical: 20),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }
}
