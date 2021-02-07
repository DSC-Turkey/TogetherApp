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
        backgroundColor: Color(0xFFF4B400),
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
                      text: "TOGETHER",
                      bottompad: 0,
                    ),
                    HeadingContainer(
                      text: "CHANGE",
                      bottompad: 50,
                    ),
                  ],
                ),
              ),
              Text(
                "Vote to Help Your Society to Achieve a Sustainable City and High Quality Education.",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 16,
                    color: Color(0xFFF2F2F2)),
              ),
              Center(
                child: Lottie.asset(
                  "assets/34065-growth.json",
                  height: 350,
                  width: 350,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: ButtonFlat(
                    margin: 10,
                    buttonWidth: w / 3,
                    color: Color(0xFFDB4437),
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
