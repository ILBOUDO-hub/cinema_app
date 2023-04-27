import 'package:flutter/material.dart';
import 'package:cinema/models/Product.dart';
import 'package:cinema/details/produit_detail.dart';

import 'code.dart';
import 'categories/movies.dart';

class Calendar extends StatefulWidget {
  List<String> _items = [
    'Tous',
    'Canal Olympia Ouaga 2000',
    'Canal Olympia Pissy',
    'Ciné Burkina',
    'Ciné Nerwaya',
  ];

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  String _selectedItem = 'Tous';
  DateTime _selectedDate = DateTime.now();
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
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 70.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 7,
                      itemBuilder: (BuildContext context, int index) {
                        DateTime date =
                            DateTime.now().add(Duration(days: index));
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedDate = date;
                            });
                          },
                          child: Container(
                            width: 70.0,
                            margin: EdgeInsets.only(right: 10.0),
                            decoration: BoxDecoration(
                              color: _selectedDate.day == date.day
                                  ? Colors.blue
                                  : Color.fromARGB(255, 220, 219, 219),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${date.day}',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5.0),
                                Text(
                                  '${_getWeekday(date.weekday)}',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                /*ListTile(
                  leading: Icon(Icons.calendar_month, color: Colors.black),
                  title:
                      Text('DateTime', style: TextStyle(color: Colors.black)),
                  onTap: () {
                    // Do something
                    setState(() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return CalendarPage();
                      }));
                    });
                  },
                ),*/
                Container(
                  //Codde pour le Dropdown pour filtrer les films en fonction des salles de cinéma
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          size: 35,
                        ),
                        onPressed: () {
                          _showDropdown(context);
                        },
                      ),
                      const SizedBox(width: 10.0),
                      Text(_selectedItem),
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

  // Récupérer le jour de la semaine à partir de l'indice
  String _getWeekday(int weekday) {
    switch (weekday) {
      case 1:
        return 'Lun';
      case 2:
        return 'Mar';
      case 3:
        return 'Mer';
      case 4:
        return 'Jeu';
      case 5:
        return 'Ven';
      case 6:
        return 'Sam';
      case 7:
        return 'Dim';
      default:
        return "Invalid day";
    }
  }

  void _showDropdown(BuildContext context) {
    //Fonction pour le dropdown des salles de cinéma 
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: Container(
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget._items.length,
              itemBuilder: (BuildContext context, int index) {
                String item = widget._items[index];
                return ListTile(
                  title: Text(item),
                  onTap: () {
                    setState(() {
                      _selectedItem = item;
                    });
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
