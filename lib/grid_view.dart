import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login_screen2/neighborhood_pick.dart';
import 'package:custom_dialog/custom_dialog.dart';

class ListViewDemo extends StatefulWidget {
  @override
  _ListViewDemoState createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  List pages = ["/add", "/rankings"];
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
  int flag = 0;

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

  Future<int> fetchTotalData(Sehir sehir) async {
    final response = await FirebaseFirestore.instance
        .collection("Cities")
        .doc(sehir.neighborhood)
        .get();
    setState(() {
      gelenOy = response.data()["Total"];
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
    int oy6 = oyGetir6(iletilenArgumanlar);
    int oy7 = oyGetir7(iletilenArgumanlar);
    int oy8 = oyGetir8(iletilenArgumanlar);
    int oy9 = oyGetir9(iletilenArgumanlar);
    int oy10 = oyGetir10(iletilenArgumanlar);
    var _screenWidth = MediaQuery.of(context).size.width;
    var _itemCount = (_screenWidth / 200).ceil();
    int total = oy + oy2 + oy3 + oy4 + oy6 + oy7 + oy8 + oy9 + oy10;

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        height: 50,
        items: [
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
          Navigator.pushNamed(context, pages[index]);
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
            function: () {
              total++;
              setState(() {
                if (flag == 0) {
                  oy++;
                  flag++;
                  FirebaseFirestore.instance
                      .collection("Cities")
                      .doc(iletilenArgumanlar.neighborhood)
                      .update({"GeriDonusum": oy});
                  FirebaseFirestore.instance
                      .collection("Cities")
                      .doc(iletilenArgumanlar.neighborhood)
                      .update({"Total": total});
                  showDialog(
                    context: context,
                    builder: (context) => CustomDialog(
                      content: Text(
                        'Oy Verildi',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20.0,
                        ),
                      ),
                      title: Text("Desteğin için teşekkürler"),
                      firstColor: Color(0xFF3CCF57),
                      secondColor: Colors.white,
                      headerIcon: Icon(
                        Icons.check_circle_outline,
                        size: 120.0,
                        color: Colors.white,
                      ),
                    ),
                  );
                }
              });
            },
          ),
          CustomContainer(
            yazi: "Güneş Enerjili Sokak Lambaları",
            subtext: oy2.toString(),
            function: () {
              setState(() {
                total++;
                if (flag == 0) {
                  oy2++;
                  //flag++;
                  FirebaseFirestore.instance
                      .collection("Cities")
                      .doc(iletilenArgumanlar.neighborhood)
                      .update({"Total": total});
                  FirebaseFirestore.instance
                      .collection("Cities")
                      .doc(iletilenArgumanlar.neighborhood)
                      .update({"GunesEnerjiliSokakLambalari": oy2});
                  showDialog(
                    context: context,
                    builder: (context) => CustomDialog(
                      content: Text(
                        'Oy Verildi',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20.0,
                        ),
                      ),
                      title: Text("Desteğin için teşekkürler"),
                      firstColor: Color(0xFF3CCF57),
                      secondColor: Colors.white,
                      headerIcon: Icon(
                        Icons.check_circle_outline,
                        size: 120.0,
                        color: Colors.white,
                      ),
                    ),
                  );
                }
              });
            },
          ),
          CustomContainer(
            yazi: "Yeşil Alan",
            subtext: oy3.toString(),
            function: () {
              setState(() {
                if (flag == 0) {
                  oy3++;
                  flag++;
                  total++;
                  FirebaseFirestore.instance
                      .collection("Cities")
                      .doc(iletilenArgumanlar.neighborhood)
                      .update({"YesilAlan": oy3});
                  FirebaseFirestore.instance
                      .collection("Cities")
                      .doc(iletilenArgumanlar.neighborhood)
                      .update({"Total": total});
                  showDialog(
                    context: context,
                    builder: (context) => CustomDialog(
                      content: Text(
                        'Oy Verildi',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20.0,
                        ),
                      ),
                      title: Text("Desteğin için teşekkürler"),
                      firstColor: Color(0xFF3CCF57),
                      secondColor: Colors.white,
                      headerIcon: Icon(
                        Icons.check_circle_outline,
                        size: 120.0,
                        color: Colors.white,
                      ),
                    ),
                  );
                }
              });
            },
          ),
          CustomContainer(
            yazi: "Organik Pazar",
            subtext: oy4.toString(),
            function: () {
              setState(() {
                if (flag == 0) {
                  oy4++;
                  flag++;
                  total++;
                  FirebaseFirestore.instance
                      .collection("Cities")
                      .doc(iletilenArgumanlar.neighborhood)
                      .update({"OrganikPazar": oy4});
                  FirebaseFirestore.instance
                      .collection("Cities")
                      .doc(iletilenArgumanlar.neighborhood)
                      .update({"Total": total});
                  showDialog(
                    context: context,
                    builder: (context) => CustomDialog(
                      content: Text(
                        'Oy Verildi',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20.0,
                        ),
                      ),
                      title: Text("Desteğin için teşekkürler"),
                      firstColor: Color(0xFF3CCF57),
                      secondColor: Colors.white,
                      headerIcon: Icon(
                        Icons.check_circle_outline,
                        size: 120.0,
                        color: Colors.white,
                      ),
                    ),
                  );
                }
              });
            },
          ),
          CustomContainer(
            yazi: "CO2 Emisyon Ölçümü",
            subtext: oy6.toString(),
            function: () {
              setState(() {
                if (flag == 0) {
                  oy6++;
                  flag++;
                  total++;
                  FirebaseFirestore.instance
                      .collection("Cities")
                      .doc(iletilenArgumanlar.neighborhood)
                      .update({"CO2EmisyonOlcumu": oy6});
                  FirebaseFirestore.instance
                      .collection("Cities")
                      .doc(iletilenArgumanlar.neighborhood)
                      .update({"Total": total});
                  showDialog(
                    context: context,
                    builder: (context) => CustomDialog(
                      content: Text(
                        'Oy Verildi',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20.0,
                        ),
                      ),
                      title: Text("Desteğin için teşekkürler"),
                      firstColor: Color(0xFF3CCF57),
                      secondColor: Colors.white,
                      headerIcon: Icon(
                        Icons.check_circle_outline,
                        size: 120.0,
                        color: Colors.white,
                      ),
                    ),
                  );
                }
              });
            },
          ),
          CustomContainer(
            yazi: "Eko-Danismanlik Ofisi",
            subtext: oy7.toString(),
            function: () {
              setState(() {
                if (flag == 0) {
                  oy7++;
                  flag++;
                  total++;
                  FirebaseFirestore.instance
                      .collection("Cities")
                      .doc(iletilenArgumanlar.neighborhood)
                      .update({"EkoDanismanlikOfisi": oy7});
                  FirebaseFirestore.instance
                      .collection("Cities")
                      .doc(iletilenArgumanlar.neighborhood)
                      .update({"Total": total});
                  showDialog(
                    context: context,
                    builder: (context) => CustomDialog(
                      content: Text(
                        'Oy Verildi',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20.0,
                        ),
                      ),
                      title: Text("Desteğin için teşekkürler"),
                      firstColor: Color(0xFF3CCF57),
                      secondColor: Colors.white,
                      headerIcon: Icon(
                        Icons.check_circle_outline,
                        size: 120.0,
                        color: Colors.white,
                      ),
                    ),
                  );
                }
              });
            },
          ),
          CustomContainer(
            yazi: "Elektrikli Toplu Taşıma",
            subtext: oy8.toString(),
            function: () {
              setState(() {
                if (flag == 0) {
                  oy8++;
                  flag++;
                  total++;
                  FirebaseFirestore.instance
                      .collection("Cities")
                      .doc(iletilenArgumanlar.neighborhood)
                      .update({"ElektrikliTopluTasima": oy8});
                  FirebaseFirestore.instance
                      .collection("Cities")
                      .doc(iletilenArgumanlar.neighborhood)
                      .update({"Total": total});
                  showDialog(
                    context: context,
                    builder: (context) => CustomDialog(
                      content: Text(
                        'Oy Verildi',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20.0,
                        ),
                      ),
                      title: Text("Desteğin için teşekkürler"),
                      firstColor: Color(0xFF3CCF57),
                      secondColor: Colors.white,
                      headerIcon: Icon(
                        Icons.check_circle_outline,
                        size: 120.0,
                        color: Colors.white,
                      ),
                    ),
                  );
                }
              });
            },
          ),
          CustomContainer(
            yazi: "Evlere Günes Paneli Kurulumu",
            subtext: oy9.toString(),
            function: () {
              setState(() {
                if (flag == 0) {
                  oy9++;
                  flag++;
                  total++;
                  FirebaseFirestore.instance
                      .collection("Cities")
                      .doc(iletilenArgumanlar.neighborhood)
                      .update({"EvlereGunesPaneliKurulumu": oy9});
                  FirebaseFirestore.instance
                      .collection("Cities")
                      .doc(iletilenArgumanlar.neighborhood)
                      .update({"Total": total});
                  showDialog(
                    context: context,
                    builder: (context) => CustomDialog(
                      content: Text(
                        'Oy Verildi',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20.0,
                        ),
                      ),
                      title: Text("Desteğin için teşekkürler"),
                      firstColor: Color(0xFF3CCF57),
                      secondColor: Colors.white,
                      headerIcon: Icon(
                        Icons.check_circle_outline,
                        size: 120.0,
                        color: Colors.white,
                      ),
                    ),
                  );
                }
              });
            },
          ),
          CustomContainer(
            yazi: "Harabe Bina Şikayeti",
            subtext: oy10.toString(),
            function: () {
              setState(() {
                if (flag == 0) {
                  oy10++;
                  flag++;
                  total++;
                  FirebaseFirestore.instance
                      .collection("Cities")
                      .doc(iletilenArgumanlar.neighborhood)
                      .update({"HarabeBinaSikayeti": oy10});
                  FirebaseFirestore.instance
                      .collection("Cities")
                      .doc(iletilenArgumanlar.neighborhood)
                      .update({"Total": total});
                  showDialog(
                    context: context,
                    builder: (context) => CustomDialog(
                      content: Text(
                        'Oy Verildi',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20.0,
                        ),
                      ),
                      title: Text("Desteğin için teşekkürler"),
                      firstColor: Color(0xFF3CCF57),
                      secondColor: Colors.white,
                      headerIcon: Icon(
                        Icons.check_circle_outline,
                        size: 120.0,
                        color: Colors.white,
                      ),
                    ),
                  );
                }
              });
            },
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
    this.imagePath = "assets/eco_ev.jpg",
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
