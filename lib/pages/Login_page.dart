import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _passwordVisible = false;
  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false, body: getBody(context));
  }

  GestureDetector getBody(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(children: [
            Container(
              height: MediaQuery.of(context).size.height / 3.5,
              width: MediaQuery.of(context).size.width,
              color: Color(0xff3F5CEB),
            )
          ]),
          Positioned(
            left: 17,
            right: 17,
            top: MediaQuery.of(context).size.height / 5.8,
            //    bottom: MediaQuery.of(context).viewInsets.bottom,
            child: Container(
              height: 450,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(style: BorderStyle.solid),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ]),
              child: Column(
                children: [
                  signInText(),
                  SizedBox(height: 15),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        usenameTextField(),
                        SizedBox(height: 27),
                        passwordTextField(),
                        SizedBox(height: 40),
                        submitButton()
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  forgetPassword(),
                ],
              ),
            ),
          ),
          signUp()
        ],
      ),
    );
  }

  Positioned signUp() {
    return Positioned(
      bottom: 20,
      child: Row(
        children: [
          Text(
            "Don't have an account ? ",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TextButton(
              onPressed: () {
                print("Sign UP");
              },
              child: Text(
                "SIGN UP",
                style: TextStyle(
                    color: Color(0xff3F5CEB),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }

  Padding signInText() {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Text(
        "Sign in",
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
      ),
    );
  }

  Padding forgetPassword() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: GestureDetector(
        child: Text(
          "Forget password ?",
          style: TextStyle(
              color: Color(0xff3F5CEB),
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        onTap: () {
          print("forget password");
        },
      ),
    );
  }

  ElevatedButton submitButton() {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        "SIGN IN",
        style: TextStyle(fontSize: 20),
      ),
      style: ElevatedButton.styleFrom(
        primary: Color(0xff3F5CEB),
        onPrimary: Colors.white,
        //shadowColor: Colors.blue.shade700,
        elevation: 3,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
        minimumSize: Size(180, 45), //////// HERE
      ),
    );
  }

  Padding passwordTextField() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        textInputAction: TextInputAction.done,
        validator: (val) {
          if (val == null || val.isEmpty) return 'Please enter some text';

          return null;
        },
        obscureText: !_passwordVisible,
        cursorWidth: 3,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
                !_passwordVisible ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
          hintText: "Password",
          contentPadding: EdgeInsets.only(left: 17),
          border: UnderlineInputBorder(borderSide: BorderSide(width: 0.8)),
        ),
        style: TextStyle(fontSize: 22),
      ),
    );
  }

  Padding usenameTextField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: TextFormField(
          validator: (val) {
            if (val == null || val.isEmpty) return 'Please enter some text';

            return null;
          },
          cursorWidth: 3,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: "Username",
            contentPadding: EdgeInsets.only(left: 17),
            border: UnderlineInputBorder(borderSide: BorderSide(width: 0.8)),
          ),
          style: TextStyle(fontSize: 22),
          textInputAction: TextInputAction.next),
    );
  }
}
