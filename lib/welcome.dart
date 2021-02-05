import 'package:flutter/material.dart';
import 'package:login_screen2/components.dart';
import 'package:lottie/lottie.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0xFF0E0B12),
        body: Container(
          height: h,
          width: w,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                height: h / 5,
                child: Stack(
                  children: [
                    HeadingContainer(
                      text: "HELP ME",
                      bottompad: 0,
                    ),
                    HeadingContainer(
                      text: "NOW!",
                      bottompad: 50,
                    ),
                    SubheadingContainer(text: "Save Lives"),
                  ],
                ),
              ),
              Center(
                child: Lottie.network(
                  "https://assets10.lottiefiles.com/private_files/lf30_wwq2op12.json",
                  height: 250,
                  width: 250,
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 170),
                  child: ButtonFlat(
                    margin: 10,
                    buttonWidth: w / 3,
                    color: Colors.deepPurple,
                    nextPage: "/signup",
                    widget: Center(
                      child: Text(
                        "Continue",
                        style: kButtonTitle,
                      ),
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
