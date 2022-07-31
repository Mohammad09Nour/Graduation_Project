import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/password_args.dart';
import 'package:flutter_application_1/widgets/emaiFormField.dart';
import 'package:flutter_application_1/widgets/passwordFormField.dart';
import 'package:flutter_application_1/widgets/submit_button.dart';
import 'package:flutter_application_1/widgets/username_text_field.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class RegisterPage extends StatelessWidget {
  final bool isLogin;
  final Duration animationDuration;
  final double defaultLoginSize;
  final PasswordArgs passArgs;
  final formKey;

  RegisterPage({
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
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
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
                  SizedBox(height: 40),
                  getPic(),
                  SizedBox(height: 40),
                  Form(
                      key: formKey,
                      child: Column(
                        children: [
                          UserName(),
                          SizedBox(height: 10),
                          EmailField(size: passArgs.size),
                          SizedBox(height: 10),
                          PasswordFormField(args: passArgs),
                          SizedBox(height: 10),
                          getPhoneNumber(),
                          SizedBox(height: 10),
                          SubmitButton(
                              text: "SIGN UP",
                              size: passArgs.size,
                              callbackValidator: () {
                                if (formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Processing Data')),
                                  );
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

          if (!val.startsWith('+963') || val.length != 14)
            return 'Please enter a valid number';
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
          prefixIcon: Padding(
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

  Container getPic() {
    return Container(
      width: passArgs.size.width * 0.8,
      height: passArgs.size.height * 0.2,
      child: SvgPicture.asset('images/register.svg'),
    );
  }
}
