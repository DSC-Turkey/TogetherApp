import 'package:flutter/material.dart';

const kHeadingStyle = TextStyle(
  fontSize: 60,
  fontWeight: FontWeight.bold,
  color: Color(0xFFF2F2F2),
  fontFamily: "Poppins",
);

const kSubHeading = TextStyle(
  color: Colors.white,
  fontSize: 25,
);

const kButtonTitle = TextStyle(
  fontSize: 25,
  color: Color(0xFFF2F2F2),
  fontFamily: "Poppins",
);

class HeadingContainer extends StatelessWidget {
  HeadingContainer({
    @required this.text,
    @required this.bottompad,
  });
  final String text;
  final double bottompad;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, bottompad, 0, 0),
      child: Text(
        text,
        style: kHeadingStyle,
      ),
    );
  }
}

class SubheadingContainer extends StatelessWidget {
  final String text;
  SubheadingContainer({
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: kSubHeading,
      ),
      padding: EdgeInsets.fromLTRB(0, 110, 0, 0),
    );
  }
}

class ButtonFlat extends StatelessWidget {
  ButtonFlat(
      {this.margin = 0,
      this.buttonWidth,
      this.nextPage,
      this.color,
      this.widget});

  final double buttonWidth;
  final String nextPage;
  final Widget widget;
  final Color color;
  final double margin;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: color,
      onPressed: () {
        Navigator.pushNamed(context, nextPage);
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Container(
        margin: EdgeInsets.all(margin),
        width: buttonWidth,
        child: widget,
      ),
    );
  }
}

class LoginFormField extends StatelessWidget {
  final bool obscure;
  final String label;
  final String hint;
  final TextEditingController control;
  final IconData icon;

  LoginFormField({
    @required this.control,
    this.obscure,
    this.label,
    this.hint,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: TextFormField(
          controller: control,
          obscureText: obscure,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            labelText: label,
            hintText: hint,
            fillColor: Colors.white,
            filled: true,
            prefixIcon: Icon(icon),
          ),
        ),
      ),
    );
  }
}

InputDecoration buildInputDecoration(
    IconData icons, String hinttext, Color color, bool filled) {
  return InputDecoration(
    fillColor: color,
    filled: filled,
    hintText: hinttext,
    prefixIcon: Icon(icons),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: BorderSide(color: Colors.green, width: 1.5),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: BorderSide(
        color: Colors.blue,
        width: 1.5,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: BorderSide(
        color: Colors.blue,
        width: 1.5,
      ),
    ),
  );
}
