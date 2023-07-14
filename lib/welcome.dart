import 'package:cinema/categories/movies.dart';
import 'package:cinema/controllers/moviesController.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'details/movie_detail.dart';

class Welcome extends StatefulWidget {
  final List<String> _items = [
    'Tous',
    'Canal Olympia Ouaga 2000',
    'Canal Olympia Pissy',
    'Ciné Burkina',
    'Ciné Nerwaya',
  ];

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with SingleTickerProviderStateMixin {
  final MoviesController myController = Get.find<MoviesController>();
  List<String> categories = [
    'Recommandé',
    'Africain',
    'Action',
    'Comedie',
    'Romance',
    'Animation',
    'Drama',
    'Science-Fiction',
    'Horreur',
  ];

  int selectedIndex = 0;

  /*final List<Map<String, dynamic>> _movies = [
    {
      'title': 'Black Adam',
      'image': "assets/images/adam.jfif",
      'categorie': 'Action',
      'auteur': 'Action',
      'price': '2000',
      'urlvideo': 'assets/real.mp4',
      'description':
          "En l’an 2154, Jake Sully, ancien marine paraplégique, accepte de participer au programme Avatar pour remplacer son frère jumeau décédé, Tom Sully. Il est envoyé sur Pandora, l’une des lunes de Polyphème, une planète géante gazeuse en orbite autour d'Alpha Centauri A.En outre, la planète est habitée par les Na'vis, une espèce indigène humanoïde qu'ils considèrent comme primitive et hostile. Pourtant, ces derniers se caractérisent par un mode de vie en totale harmonie avec la nature.",
    },
    {
      'title': 'Black Panthere',
      'image': "assets/images/panther.jfif",
      'categorie': 'Action',
      'auteur': 'Black Widow',
      'price': '2000',
      'urlvideo': 'assets/real.mp4',
      'description':
          "En l’an 2154, Jake Sully, ancien marine paraplégique, accepte de participer au programme Avatar pour remplacer son frère jumeau décédé, Tom Sully. Il est envoyé sur Pandora, l’une des lunes de Polyphème, une planète géante gazeuse en orbite autour d'Alpha Centauri A.En outre, la planète est habitée par les Na'vis, une espèce indigène humanoïde qu'ils considèrent comme primitive et hostile. Read more...",
    },
    {
      'title': 'Astérix',
      'image': "assets/images/asterix.jfif",
      'categorie': 'Animation',
      'auteur': 'Black Widow',
      'price': '2000',
      'urlvideo': 'assets/real.mp4',
      'description':
          "En l’an 2154, Jake Sully, ancien marine paraplégique, accepte de participer au programme Avatar pour remplacer son frère jumeau décédé, Tom Sully. Il est envoyé sur Pandora, l’une des lunes de Polyphème, une planète géante gazeuse en orbite autour d'Alpha Centauri A.En outre, la planète est habitée par les Na'vis, une espèce indigène humanoïde qu'ils considèrent comme primitive et hostile. Pourtant, ces derniers se caractérisent par un mode de vie en totale harmonie avec la nature.",
    },
    {
      'title': 'Age Of Ultron',
      'image': "assets/images/avengers.jfif",
      'categorie': 'Action',
      'auteur': 'Black Widow',
      'price': '2000',
      'urlvideo': 'assets/real.mp4',
      'description':
          "En l’an 2154, Jake Sully, ancien marine paraplégique, accepte de participer au programme Avatar pour remplacer son frère jumeau décédé, Tom Sully. Il est envoyé sur Pandora, l’une des lunes de Polyphème, une planète géante gazeuse en orbite autour d'Alpha Centauri A.En outre, la planète est habitée par les Na'vis, une espèce indigène humanoïde qu'ils considèrent comme primitive et hostile. Pourtant, ces derniers se caractérisent par un mode de vie en totale harmonie avec la nature.",
    },
    {
      'title': 'Demon Slayer',
      'image': "assets/images/demon.jfif",
      'categorie': 'Animation',
      'auteur': 'Anime',
      'price': '2000',
      'urlvideo': 'assets/real.mp4',
      'description':
          "En l’an 2154, Jake Sully, ancien marine paraplégique, accepte de participer au programme Avatar pour remplacer son frère jumeau décédé, Tom Sully. Il est envoyé sur Pandora, l’une des lunes de Polyphème, une planète géante gazeuse en orbite autour d'Alpha Centauri A.En outre, la planète est habitée par les Na'vis, une espèce indigène humanoïde qu'ils considèrent comme primitive et hostile. Pourtant, ces derniers se caractérisent par un mode de vie en totale harmonie avec la nature.",
    },
    {
      'title': 'Avatar',
      'image': "assets/images/avatar.jfif",
      'categorie': "Action",
      'auteur': 'Science-Fiction',
      'price': '2000',
      'urlvideo': 'assets/real.mp4',
      'description':
          "En l’an 2154, Jake Sully, ancien marine paraplégique, accepte de participer au programme Avatar pour remplacer son frère jumeau décédé, Tom Sully. Il est envoyé sur Pandora, l’une des lunes de Polyphème, une planète géante gazeuse en orbite autour d'Alpha Centauri A.En outre, la planète est habitée par les Na'vis, une espèce indigène humanoïde qu'ils considèrent comme primitive et hostile. Pourtant, ces derniers se caractérisent par un mode de vie en totale harmonie avec la nature.",
    },
  ];*/

  int selectedCategoryIndex = 0;

  @override
  void initState() {
    super.initState();
    myController.fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
              const SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "CinePlus",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          fontFamily: "Times new roman"),
                    ),
                    IconButton(
                      color: Colors.black,
                      iconSize: 30,
                      icon: const Icon(Icons.notifications),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.only(right: 0),
                child: Container(
                  height: 50,
                  margin: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10.0),
                      bottom: Radius.circular(10.0),
                    ),
                    color: Color.fromARGB(255, 224, 223, 223),
                  ),
                  child: Row(
                    children: [
                      const Expanded(
                        child: TextField(
                          //controller: _searchController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            border: InputBorder.none,
                            hintText: 'Rechercher',
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 12.0,
                              horizontal: 8.0,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.filter_list,
                          // size: 35,
                        ),
                        onPressed: () {
                          _showDropdown(context);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              /*Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  //color: Colors.blueAccent,
          
                  height: 200,
          
                  //width: 400,
          
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    //image: DecorationImage(image: AssetImage("assets/categories/4.jpg"))
                    color: Colors.blueAccent,
                  ),
                ),
              ),*/
              Container(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategoryIndex = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 15, bottom: 0),
                        decoration: BoxDecoration(
                          /*border: Border.all(
                            color: selectedCategoryIndex == index ? Colors.red : Colors.transparent,
                            width: 2,
                          ),*/
                          color: selectedCategoryIndex == index
                              ? Colors.blue
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          categories[index],
                          style: TextStyle(
                              color: selectedCategoryIndex == index
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Times new roman"),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10.0),
              Container(
                height: 310,
                child: ListView.builder(
                  //padding: EdgeInsets.only(left: 10.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: myController.movies.length,
                  itemBuilder: (context, index) {
                    final movie = myController.movies[index];
                    //Movie movie = MoviesController.instance
                    //  .fetchMovies()
                    //  .where((element) {
                    //  element as Movie;
                    return Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MovieDetail(
                                  imagePath: movie.image,
                                  price: "2000",
                                  title: movie.title,
                                  author: "Adams",
                                  description: movie.description,
                                  categorie: movie.category,
                                  urlvideo: movie.video,
                                  //isFavorite: gleinfo.isFavorite,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 250,
                                  width: 200,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      image: DecorationImage(
                                          image: NetworkImage(movie.image),
                                          fit: BoxFit.cover)
                                      ),
                                ),
                                //SizedBox(height: 10),
                                Text(
                                  movie.title,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  movie.category,
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ),
                        /*SizedBox(
                          width: 10,
                        )*/
                      ],
                    );
                    //});
                  },
                ),
              ),
              //const SizedBox(height: 10.0),
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Row(
                  //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "A venir...",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: "Times new roman"),
                    ),
                    Text(
                      "",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          fontFamily: "Times new roman"),
                    ),
                  ],
                ),
              ),
              /*Container(
                height: 310,
                child: ListView.builder(
                  //padding: EdgeInsets.only(left: 10.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: _movies.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MovieDetail(
                                  imagePath: _movies[index]['image'],
                                  price: _movies[index]['price'],
                                  title: _movies[index]['title'],
                                  author: _movies[index]['author'],
                                  description: _movies[index]['description'],
                                  urlvideo: _movies[index]['urlvideo'],
                                  //isFavorite: gleinfo.isFavorite,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 250,
                                  width: 200,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      image: DecorationImage(
                                          image: AssetImage(
                                            _movies[index]['image'],
                                          ),
                                          fit: BoxFit.cover)),
                                ),
                                //SizedBox(height: 10),
                                Text(
                                  _movies[index]['title'],
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  _movies[index]['categorie'],
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ),
                        /*SizedBox(
                          width: 10,
                        )*/
                      ],
                    );
                  },
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }

  void _showDropdown(BuildContext context) {
    //Fonction pour le dropdown des salles de cinéma
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget._items.length,
              itemBuilder: (BuildContext context, int index) {
                String item = widget._items[index];
                return ListTile(
                  title: Text(item),
                  onTap: () {
                    /*setState(() {
                      _selectedItem = item;
                    });*/
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
