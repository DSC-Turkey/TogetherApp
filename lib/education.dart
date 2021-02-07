import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Iskele(),
    );
  }
}

class Iskele extends StatefulWidget {
  @override
  _IskeleState createState() => _IskeleState();
}

class _IskeleState extends State<Iskele> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  List pages = [
    "/rankings",
    "/add",
    "/education",
  ];
  int _selectedIndex = 0;
  var gelenYaziBasligi = "";
  var gelenYaziIcerigi = "";

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  yaziEkle() {
    FirebaseFirestore.instance
        .collection("Dersler")
        .doc(t1.text)
        .set({'baslik': t1.text, 'icerik': t2.text}).whenComplete(
            () => print("Yazı eklendi"));
  }

  yaziGuncelle() {
    FirebaseFirestore.instance
        .collection("Dersler")
        .doc(t1.text)
        .update({'baslik': t1.text, 'icerik': t2.text}).whenComplete(
            () => print("Yazı güncellendi"));
  }

  yaziSil() {
    FirebaseFirestore.instance.collection("Dersler").doc(t1.text).delete();
  }

  yaziGetir() {
    FirebaseFirestore.instance
        .collection("Dersler")
        .doc(t1.text)
        .get()
        .then((gelenVeri) {
      setState(() {
        gelenYaziBasligi = gelenVeri.data()['baslik'];
        gelenYaziIcerigi = gelenVeri.data()['icerik'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Eğitim",
          style: TextStyle(fontFamily: "Poppins"),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        height: 50,
        items: [
          Icon(
            FontAwesomeIcons.trophy,
            size: 24,
          ),
          Icon(
            FontAwesomeIcons.plus,
            size: 35,
          ),
          Icon(
            FontAwesomeIcons.graduationCap,
            size: 24,
          )
        ],
        onTap: (index) {
          _onItemTap(index);
          Navigator.pushNamed(context, pages[index]);
        },
      ),
      body: Container(
        margin: EdgeInsets.all(5),
        child: Center(
          child: Container(
            padding: EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Image.asset("assets/Education.png"),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: t1,
                  decoration: InputDecoration(
                    labelText: "Ders Adı ve Saati",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Google Meet Linki",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  controller: t2,
                ),
                Row(
                  children: [
                    Expanded(
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text("Ders Ekle"),
                          onPressed: () {
                            yaziEkle();
                            yaziGetir();
                          }),
                    ),
                    Expanded(
                      child: RaisedButton(
                        child: Text(
                          "Sil",
                          style: TextStyle(fontFamily: "Poppins"),
                        ),
                        onPressed: yaziSil,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    Expanded(
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            "Dersleri Görüntüle",
                            textAlign: TextAlign.center,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, "/lessons");
                          }),
                    ),
                  ],
                ),
                ListTile(
                  title: Text(gelenYaziBasligi),
                  subtitle: Text(gelenYaziIcerigi),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
