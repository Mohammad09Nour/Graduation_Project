import 'dart:ui';

class PasswordArgs {
  final void Function() callback;
  final bool passwordVisible;
  final Size size;

  PasswordArgs(
      {required this.callback,
      required this.passwordVisible,
      required this.size});
}
