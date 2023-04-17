import 'package:cinema/accueil.dart';
import 'package:flutter/material.dart';
import 'package:cinema/models/Product.dart';
import 'package:cinema/details/produit_detail.dart';

import 'categories/movies.dart';

class Calendar extends StatefulWidget {
  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  List<Container> movieOscar = [];

  buildList() async {
    //BuildList recupere tous les articles a travers une boucle et les affiches dans un container
    for (var i = 0; i < gateau.length; i++) {
      final gleinfo = gateau[i];
      //final String categorieposter = gleinfo.name;
      if (gleinfo.categorie == "action") {
        movieOscar.add(Container(
          //  width: 260,
          color: const Color.fromARGB(255, 252, 252, 249),
          //  padding: EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProduitDetail(
                      //La page galerie de chaque boutique est retourne
                      assetPath1: gleinfo.imgPath1,
                      assetPath2: gleinfo.imgPath2,
                      cookieprice: gleinfo.price,
                      cookiename: gleinfo.name,
                      cookieauteur: gleinfo.auteur)));
            },
            child: Card(
              elevation: 1.0,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage(gleinfo.imgPath1),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        //Nom de la boutique
                        gleinfo.auteur,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        //categorie d'article vendu
                        gleinfo.categorie.toUpperCase(),
                        style: const TextStyle(fontSize: 16),
                      ),
                      const Text(
                        //Localisation de la boutique
                        "Ouagadougou, Burkina Faso",
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
      }
    }
  }

  @override
  void initState() {
    super.initState();
    buildList();
  }

  final commentaireController = TextEditingController();
  List<String> ListCategories = [
    "00",
    "01",
    "02",
    "03",
    "04",
    "05",
    "06",
    "07",
    "08",
  ];
  final List<Widget> _tabList = [
    Accueil(),
    Accueil(),
    Accueil(),
    Accueil(),
    Accueil(),
    Accueil(),
    Accueil(),
    Accueil(),
    Accueil(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: const Color(0xFFFCFAF8),
          appBar: AppBar(
            elevation: 2,
            title: const Text('E-cinema'),
            centerTitle: false,
            titleTextStyle: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            backgroundColor: Colors.blue,
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.notifications_none),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return Movies();
                  }));
                },
              ),
            ],
          ),
          body: Stack(children: [
            ListView(
              children: [
                const SizedBox(height: 10.0),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (int i = 1; i < 9; i++)
                        // for(int j=1; j<6; j++)
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          padding:
                              EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(.30),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return _tabList[i];
                              }));
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.calendar_month_sharp),
                                Text(
                                  ListCategories[i],
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Container(
                  //padding: const EdgeInsets.only(right: 17.0),
                  margin: const EdgeInsets.all(10.0),
                  width: MediaQuery.of(context).size.width - 20.0,
               //   height: MediaQuery.of(context).size.height - 50.0,
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    //Recupere ici toutes les boutiques
                    children: movieOscar,
                  ),
                ),
    
              ],
            )
          ])),
    );
  }
}
