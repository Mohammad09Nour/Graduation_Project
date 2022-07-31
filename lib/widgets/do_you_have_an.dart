import 'package:flutter/cupertino.dart';

import '../constants.dart';

class DoYouHaveAnAccount extends StatelessWidget {
  final double viewInsets;
  final AnimationController animationController;
  final bool isLogin;
  final void Function() callback;
  final Animation<double> containerSize;
  const DoYouHaveAnAccount(
      {Key? key,
      required this.viewInsets,
      required this.animationController,
      required this.isLogin,
      required this.callback,
      required this.containerSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  AnimatedBuilder getBody() {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        if (isLogin && viewInsets == 0 || !isLogin)
          return GestureDetector(
            onTap: () {
              if (isLogin) {
                animationController.forward();
                callback();
              }
            },
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: containerSize.value,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                      topRight: Radius.circular(100),
                    ),
                    color: kBackgroundColor),
                child: isLogin
                    ? Text(
                        "Don't have an account? LOGIN",
                        style: TextStyle(
                          fontSize: 18,
                          color: kPrimaryColor,
                        ),
                      )
                    : null,
              ),
            ),
          );

        return Container();
      },
    );
  }
}
