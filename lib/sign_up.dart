import 'package:flutter/material.dart';
import 'package:login_screen2/components.dart';
import 'package:lottie/lottie.dart';
import 'auth_provider.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0xFFEC4646),
        body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          height: h,
          width: w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Stack(
                children: [
                  HeadingContainer(text: "JOIN", bottompad: 0),
                  HeadingContainer(text: "US", bottompad: 50),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: SubheadingContainer(
                      text: "Our Sustainability and Education and Us.",
                    ),
                  ),
                ],
              ),
              Container(
                height: 130,
                child: Image.asset("assets/Logo.png"),
                margin: EdgeInsets.fromLTRB(100, 90, 30, 30),
              ),
              ButtonFlat(
                color: Color(0xFF51C2D5),
                buttonWidth: w,
                nextPage: "/login",
                widget: Container(
                  width: w,
                  padding: EdgeInsets.symmetric(
                    vertical: 14,
                  ),
                  child: Center(
                    child: Text(
                      "Sign In/Sign Up",
                      style: kButtonTitle,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                onPressed: () {
                  AuthProviderService.instance.signIn();
                },
                color: Color(0xFF17141b),
                child: Container(
                  width: w,
                  padding: EdgeInsets.symmetric(
                    vertical: 14,
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Image.asset(
                            "assets/google.png",
                            height: 27,
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Text(
                            "Sign In with Google",
                            style: kButtonTitle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
