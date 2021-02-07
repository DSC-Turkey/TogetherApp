import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(RankingsPage());
}

class RankingsPage extends StatefulWidget {
  @override
  _RankingsPageState createState() => _RankingsPageState();
}

class _RankingsPageState extends State<RankingsPage> {
  int _selectedIndex = 0;
  var nairobiTotal;
  var tokyoTotal;
  var berlinTotal;
  List pages = [
    "/rankings",
    "/add",
    "/education",
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  fetchTotalDataTokyo() {
    FirebaseFirestore.instance
        .collection("Cities")
        .doc("Tokyo")
        .get()
        .then((veri) {
      setState(() {
        tokyoTotal = veri.data()["Total"];
      });
    });
  }

  fetchTotalDataNairobi() {
    FirebaseFirestore.instance
        .collection("Cities")
        .doc("Nairobi")
        .get()
        .then((veri) {
      setState(() {
        nairobiTotal = veri.data()["Total"];
      });
    });
  }

  fetchTotalDataBerlin() {
    FirebaseFirestore.instance
        .collection("Cities")
        .doc("Berlin")
        .get()
        .then((veri) {
      setState(() {
        berlinTotal = veri.data()["Total"];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    fetchTotalDataNairobi();
    fetchTotalDataTokyo();
    fetchTotalDataBerlin();
    List votes = [nairobiTotal, tokyoTotal, berlinTotal];
    votes.sort();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              title: Text(
                "Rankings",
                style:
                    TextStyle(fontFamily: "Poppins", color: Color(0xfff4f9f9)),
              ),
              pinned: false,
              expandedHeight: 198,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset("assets/ranking.png"),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    height: 200,
                    width: 500,
                    child: Card(
                      child: Center(
                        child: Column(
                          children: [
                            Text("Nairobi",
                                style: TextStyle(
                                  fontSize: 45,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.bold,
                                )),
                            Text("Total Votes: ${votes[2].toString()}",
                                style: TextStyle(
                                    color: Colors.yellow[600], fontSize: 40)),
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 200,
                    width: 500,
                    child: Card(
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              "Berlin",
                              style: TextStyle(
                                  fontSize: 45,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.bold),
                            ),
                            Text("Total Votes: ${votes[1].toString()}",
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 40,
                                )),
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 200,
                    width: 500,
                    child: Card(
                      child: Center(
                        child: Column(
                          children: [
                            Text("Tokyo",
                                style: TextStyle(
                                  fontSize: 45,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.bold,
                                )),
                            Text("Total Votes: ${votes[0].toString()}",
                                style: TextStyle(
                                    color: Colors.deepOrange[800],
                                    fontSize: 40)),
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 200,
                    width: 500,
                    child: Card(
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              "İstanbul",
                              style: TextStyle(
                                  fontSize: 45,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.bold),
                            ),
                            Text("Total Votes: ${(votes[0] + 3).toString()}",
                                style: TextStyle(
                                    color: Colors.deepOrange[800],
                                    fontSize: 40)),
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
