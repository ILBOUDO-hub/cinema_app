import 'package:flutter/material.dart';
import 'package:cinema/details/movie_detail.dart';
import 'package:cinema/models/Product.dart';

class Favoris extends StatefulWidget {
  @override
  State<Favoris> createState() => _FavorisState();
}

class _FavorisState extends State<Favoris> {
  List<Container> movieOscar = [];

  @override
  void initState() {
    super.initState();
    _buildList();
  }

  void _buildList() async {
    //BuildList recupere tous les articles a travers une boucle et les affiches dans un container
    for (var i = 0; i < gateau.length; i++) {
      final gleinfo = gateau[i];
      final String cookiecategorie = gleinfo.categorie;
      //final String categorieposter = gleinfo.name;
      if (cookiecategorie == "action") {
        final String priceposter = gleinfo.price.toString();

        movieOscar.add(Container(
            //  width: 260,
            color: Color.fromARGB(255, 252, 252, 249),
            //  padding: EdgeInsets.all(8.0),
            child: Card(
              elevation: 1.0,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieDetail(
                      imagePath: gleinfo.imgPath1,
                      assetPath2: gleinfo.imgPath2,
                      price: gleinfo.price,
                      title: gleinfo.name,
                      author: gleinfo.auteur,
                      categorie: gleinfo.categorie,
                        //isFavorite: gleinfo.isFavorite,
                      ),
                    ),
                  );
                },
                child: Column(
                  children: <Widget>[
                      //Hero responsable de l'affichage des details de chaque article
                      Hero(
                        tag: gleinfo.imgPath1,
                        child: Container(
                          height: 160,
                          width: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(gleinfo.imgPath1),
                              fit: BoxFit.cover,
                            ),
                          ),
                          alignment: Alignment.bottomRight,
                        ),
                      ),
                    
                    Text(gleinfo.name, //On cast
                        //On cast ici le prix de l'enitier vers le string
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            color: Color(0xFF575E67),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Varela',
                            fontSize: 18.0)),
                  ],
                ),
              ),
            )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFAF8),
      appBar: AppBar(
        title: const Text('Mes favoris'),
        centerTitle: true,
        titleTextStyle: const TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.maybePop(context),
        ),
      ),
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 15.0),
          SizedBox(
           // padding: const EdgeInsets.only(right: 25.0),
            width: MediaQuery.of(context).size.width - 30.0,
           // height: MediaQuery.of(context).size.height - 50.0,
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 0.815,
              crossAxisCount: 2,
              shrinkWrap: true,
              //movieOscar qui liste les articles
              children: movieOscar,
            ),
          ),
          const SizedBox(height: 200.0)
        ],
      ),
    );
  }
}
