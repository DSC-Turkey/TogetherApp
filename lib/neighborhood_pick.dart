import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:login_screen2/components.dart';

class NeighborhoodPage extends StatefulWidget {
  @override
  _NeighborhoodPageState createState() => _NeighborhoodPageState();
}

class _NeighborhoodPageState extends State<NeighborhoodPage> {
  var selectedN;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0xFF0E0B12),
        body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          height: h,
          width: w,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Pick City",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("Cities")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Text("Loading");
                    } else {
                      List<DropdownMenuItem> sehirler = [];
                      for (int i = 0; i < snapshot.data.docs.length; i++) {
                        DocumentSnapshot snap = snapshot.data.docs[i];
                        sehirler.add(
                          DropdownMenuItem(
                            child: Text(
                              snap.id,
                            ),
                            value: "${snap.id}",
                          ),
                        );
                      }
                      return DropdownButton(
                        style: TextStyle(color: Colors.blue),
                        items: sehirler,
                        onChanged: (neighborhood) {
                          setState(() {
                            selectedN = neighborhood;
                          });
                        },
                        value: selectedN,
                      );
                    }
                  },
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      "/gridview",
                      arguments: Sehir(
                        neighborhood: selectedN,
                      ),
                    );
                  },
                  child: Text(
                    "Continue",
                    style: kButtonTitle,
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

class Sehir {
  String neighborhood;
  Sehir({this.neighborhood});
}
