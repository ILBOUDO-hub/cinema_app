import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'details/movie_detail.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);
  List<String> _items = [
    'Toutes',
    'Action',
    'Horreur',
    'Comédie',
    'Amour',
  ];
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _searchController = TextEditingController();
  CarouselController _carouselController = CarouselController();
  int _current = 0;

  List<dynamic> _movies = [
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
      'categorie': 'Godzilla Vs Kong',
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
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
            onPressed: () {},
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          // Fermer le clavier lorsque l'utilisateur appuie n'importe où sur l'écran
          FocusScope.of(context).unfocus();
        },
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Image.asset(_movies[_current]['image'], fit: BoxFit.cover),
              Positioned(
                child: Container(
                  height: 50,
                  margin: const EdgeInsets.only(
                      top: 10, left: 20, right: 20, bottom: 10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10.0),
                      bottom: Radius.circular(10.0),
                    ),
                    color: Color.fromARGB(255, 224, 223, 223),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          decoration: const InputDecoration(
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
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.grey.shade50.withOpacity(1),
                        Colors.grey.shade50.withOpacity(1),
                        Colors.grey.shade50.withOpacity(1),
                        Colors.grey.shade50.withOpacity(1),
                        Colors.grey.shade50.withOpacity(0.0),
                        Colors.grey.shade50.withOpacity(0.0),
                        Colors.grey.shade50.withOpacity(0.0),
                        Colors.grey.shade50.withOpacity(0.0),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width,
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 500.0,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.70,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    },
                  ),
                  carouselController: _carouselController,
                  items: _movies.map((movie) {
                    return Builder(
                      builder: (BuildContext context) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MovieDetail(
                                  imagePath: movie['image'],
                                  price: movie['price'],
                                  title: movie['title'],
                                  author: movie['auteur'],
                                  description: movie['description'],
                                  urlvideo: movie['urlvideo'],
                                  //isFavorite: gleinfo.isFavorite,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    height: 320,
                                    margin: const EdgeInsets.only(top: 30),
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Image.asset(movie['image'],
                                        fit: BoxFit.cover),
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    movie['title'],
                                    style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  // rating
                                  const SizedBox(height: 20),
                                  Container(
                                    child: Text(
                                      movie['categorie'],
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey.shade600),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  AnimatedOpacity(
                                    duration: Duration(milliseconds: 500),
                                    opacity: _current == _movies.indexOf(movie)
                                        ? 1.0
                                        : 0.0,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                const Icon(
                                                  Icons.star,
                                                  color: Colors.yellow,
                                                  size: 20,
                                                ),
                                                const SizedBox(width: 5),
                                                Text(
                                                  '4.5',
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color:
                                                          Colors.grey.shade600),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.access_time,
                                                  color: Colors.grey.shade600,
                                                  size: 20,
                                                ),
                                                const SizedBox(width: 5),
                                                Text(
                                                  '2h',
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color:
                                                          Colors.grey.shade600),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.2,
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.play_circle_filled,
                                                  color: Colors.grey.shade600,
                                                  size: 20,
                                                ),
                                                const SizedBox(width: 5),
                                                Text(
                                                  'Trailer',
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color:
                                                          Colors.grey.shade600),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showDropdown(BuildContext context) {
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
                  title: Text(
                    item,
                    style: const TextStyle(fontFamily: 'Times new roman'),
                  ),
                  onTap: () {
                    setState(() {});
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
