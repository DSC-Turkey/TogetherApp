import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login_screen2/neighborhood_pick.dart';

class ListViewDemo extends StatefulWidget {
  @override
  _ListViewDemoState createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  int _selectedIndex = 0;
  var gelenOy;
  var gelenOy2;
  var gelenOy3;
  var gelenOy4;
  var gelenOy5;
  var gelenOy6;
  var gelenOy7;
  var gelenOy8;
  var gelenOy9;
  var gelenOy10;

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int oyGetir(Sehir sehir) {
    FirebaseFirestore.instance
        .collection("Cities")
        .doc(sehir.neighborhood)
        .get()
        .then((gelenVeri) {
      setState(() {
        gelenOy = gelenVeri.data()["GeriDonusum"];
      });
    });
    return gelenOy;
  }

  Future<int> fakeData(Sehir sehir, String key) async {
    final response = await FirebaseFirestore.instance
        .collection("Cities")
        .doc(sehir.neighborhood)
        .get();
    setState(() {
      gelenOy = response.data()[key];
    });
    return gelenOy;
  }

  int oyGetir2(Sehir sehir) {
    FirebaseFirestore.instance
        .collection("Cities")
        .doc(sehir.neighborhood)
        .get()
        .then((gelenVeri) {
      setState(() {
        gelenOy2 = gelenVeri.data()["GunesEnerjiliSokakLambalari"];
      });
    });
    return gelenOy2;
  }

  int oyGetir3(Sehir sehir) {
    FirebaseFirestore.instance
        .collection("Cities")
        .doc(sehir.neighborhood)
        .get()
        .then((gelenVeri) {
      setState(() {
        gelenOy3 = gelenVeri.data()["YesilAlan"];
      });
    });
    return gelenOy3;
  }

  int oyGetir4(Sehir sehir) {
    FirebaseFirestore.instance
        .collection("Cities")
        .doc(sehir.neighborhood)
        .get()
        .then((gelenVeri) {
      setState(() {
        gelenOy4 = gelenVeri.data()["OrganikPazar"];
      });
    });
    return gelenOy4;
  }

  int oyGetir5(Sehir sehir) {
    FirebaseFirestore.instance
        .collection("Cities")
        .doc(sehir.neighborhood)
        .get()
        .then((gelenVeri) {
      setState(() {
        gelenOy5 = gelenVeri.data()["BisikletIstasyonlarıVeYollari"];
      });
    });
    return gelenOy5;
  }

  int oyGetir6(Sehir sehir) {
    FirebaseFirestore.instance
        .collection("Cities")
        .doc(sehir.neighborhood)
        .get()
        .then((gelenVeri) {
      setState(() {
        gelenOy6 = gelenVeri.data()["CO2EmisyonOlcumu"];
      });
    });
    return gelenOy6;
  }

  int oyGetir7(Sehir sehir) {
    FirebaseFirestore.instance
        .collection("Cities")
        .doc(sehir.neighborhood)
        .get()
        .then((gelenVeri) {
      setState(() {
        gelenOy7 = gelenVeri.data()["EkoDanismanlikOfisi"];
      });
    });
    return gelenOy7;
  }

  int oyGetir8(Sehir sehir) {
    FirebaseFirestore.instance
        .collection("Cities")
        .doc(sehir.neighborhood)
        .get()
        .then((gelenVeri) {
      setState(() {
        gelenOy8 = gelenVeri.data()["ElektrikliTopluTasima"];
      });
    });
    return gelenOy8;
  }

  int oyGetir9(Sehir sehir) {
    FirebaseFirestore.instance
        .collection("Cities")
        .doc(sehir.neighborhood)
        .get()
        .then((gelenVeri) {
      setState(() {
        gelenOy9 = gelenVeri.data()["EvlereGunesPaneliKurulumu"];
      });
    });
    return gelenOy9;
  }

  int oyGetir10(Sehir sehir) {
    FirebaseFirestore.instance
        .collection("Cities")
        .doc(sehir.neighborhood)
        .get()
        .then((gelenVeri) {
      setState(() {
        gelenOy10 = gelenVeri.data()["HarabeBinaSikayeti"];
      });
    });
    return gelenOy10;
  }

  @override
  Widget build(BuildContext context) {
    final Sehir iletilenArgumanlar = ModalRoute.of(context).settings.arguments;
    int oy = oyGetir(iletilenArgumanlar);
    int oy2 = oyGetir2(iletilenArgumanlar);
    int oy3 = oyGetir3(iletilenArgumanlar);
    int oy4 = oyGetir4(iletilenArgumanlar);
    int oy5 = oyGetir5(iletilenArgumanlar);
    int oy6 = oyGetir6(iletilenArgumanlar);
    int oy7 = oyGetir7(iletilenArgumanlar);
    int oy8 = oyGetir8(iletilenArgumanlar);
    int oy9 = oyGetir9(iletilenArgumanlar);
    int oy10 = oyGetir10(iletilenArgumanlar);
    var _screenWidth = MediaQuery.of(context).size.width;
    var _itemCount = (_screenWidth / 200).ceil();

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        height: 50,
        items: [
          Icon(
            Icons.home,
            size: 30,
          ),
          Icon(
            FontAwesomeIcons.plus,
            size: 35,
          ),
          Icon(
            FontAwesomeIcons.trophy,
            size: 24,
          ),
        ],
        onTap: (index) {
          _onItemTap(index);
        },
      ),
      appBar: AppBar(
        title: Text("${iletilenArgumanlar.neighborhood}"),
        centerTitle: true,
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: (2 / 3),
          crossAxisCount: 2,
        ),
        children: [
          CustomContainer(
            yazi: "Geri Dönüşüm",
            subtext: oy.toString(),
            imagePath: "assets/eco_ev.jpg",
          ),
          CustomContainer(
            yazi: "Güneş Enerjili Sokak Lambaları",
            subtext: oy2.toString(),
          ),
          CustomContainer(
            yazi: "Yeşil Alan",
            subtext: oy3.toString(),
          ),
          CustomContainer(
            yazi: "Organik Pazar",
            subtext: oy4.toString(),
          ),
          CustomContainer(
            yazi: "Bisiklet İstasyonu",
            subtext: oy5.toString(),
          ),
          CustomContainer(
            yazi: "CO2 Emisyon Ölçümü",
            subtext: oy6.toString(),
          ),
          CustomContainer(
            yazi: "Eko-Danismanlik Ofisi",
            subtext: oy7.toString(),
          ),
          CustomContainer(
            yazi: "Elektrikli Toplu Taşıma",
            subtext: oy8.toString(),
          ),
          CustomContainer(
            yazi: "Evlere Günes Paneli Kurulumu",
            subtext: oy9.toString(),
          ),
          CustomContainer(
            yazi: "Harabe Bina Şikayeti",
            subtext: oy10.toString(),
          ),
        ],
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  final String yazi;
  final String subtext;
  final Function function;
  final String imagePath;

  CustomContainer({
    this.function,
    this.yazi = "",
    this.subtext = "",
    this.imagePath = "",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(imagePath),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.orange,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Center(
                          child: Text(
                            yazi,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                subtext,
                                style: TextStyle(fontSize: 14),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(FontAwesomeIcons.plus, size: 15),
                            ],
                          ),
                        ),
                      ],
                    ),
                    height: 60,
                    width: 600,
                  ),
                  onPressed: function,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
