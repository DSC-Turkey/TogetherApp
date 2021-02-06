import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_screen2/components.dart';
import 'package:pedantic/pedantic.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController uName = TextEditingController();
  TextEditingController pass = TextEditingController();

  girisYap() {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: uName.text, password: pass.text)
        .then((value) {
      Navigator.pushNamed(context, "/neighborhood");
    });
  }

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
          padding: EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 120,
                ),
                Text(
                  "Log In",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                LoginFormField(
                  control: uName,
                  label: "E-Mail",
                  hint: "example@example.com",
                  obscure: false,
                  icon: Icons.email_outlined,
                ),
                LoginFormField(
                  control: pass,
                  label: "Password",
                  obscure: true,
                  icon: Icons.lock_outlined,
                ),
                SizedBox(
                  height: 8,
                ),
                FlatButton(
                  onPressed: () {
                    girisYap();
                  },
                  child: Text(
                    "Log In",
                    style: kButtonTitle,
                  ),
                  color: Colors.deepPurple,
                  minWidth: 170,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      Text(
                        "You are not a member?",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: ButtonFlat(
                          nextPage: "/register",
                          margin: 10,
                          buttonWidth: w / 4,
                          color: Colors.deepPurple,
                          widget: Center(
                            child: Text(
                              "Sign Up",
                              style: kButtonTitle,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
