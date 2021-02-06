import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:login_screen2/components.dart';
import 'package:login_screen2/neighborhood_pick.dart';

class Neighborhood extends StatefulWidget {
  @override
  _NeighborhoodState createState() => _NeighborhoodState();
}

class _NeighborhoodState extends State<Neighborhood> {
  var gelenYaziBasligi = "";
  var gelenYaziIcerigi = "";

  yaziGetir(Mahalle mahalle) {
    FirebaseFirestore.instance
        .collection("Mahalleler")
        .doc(mahalle.neighborhood)
        .get()
        .then((gelenVeri) {
      setState(() {
        gelenYaziBasligi = gelenVeri.data()['Eğitim'];
        gelenYaziIcerigi = gelenVeri.data()['Geri Dönüşüm'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Mahalle iletilenArgumanlar =
        ModalRoute.of(context).settings.arguments;
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          yaziGetir(iletilenArgumanlar);
        }));
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0xFF0E0B12),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
            ),
            Text(
              gelenYaziIcerigi,
              style: kButtonTitle,
            ),
          ],
        ),
      ),
    );
  }
}
