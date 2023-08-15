import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

import 'controllers/moviesTest.dart';
import 'models/moviesTest.dart';
import 'package:flutter/material.dart';

import 'details/movie_detail.dart';
import 'details/movie_detail.dart';

class Welcome extends StatefulWidget {
  List<String> _items = [
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

  int selectedCategoryIndex = 0;

  String _selectedItem = 'Tous';

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
                padding: EdgeInsets.only(left: 10.0),
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
                child: Obx(() {
                  if (MoviesController.instance.isLoading.value) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    List<Movie> filteredMovies = [];

                    if (selectedCategoryIndex == 0) {
                      // Afficher tous les films si "Tous" est sélectionné
                      filteredMovies = MoviesController.instance.movies;
                    } else {
                      // Filtrer les films par catégorie sélectionnée
                      final selectedCategory =
                          categories[selectedCategoryIndex];
                      filteredMovies = MoviesController.instance.movies
                          .where((movie) => movie.category == selectedCategory)
                          .toList();
                    }
                    if (filteredMovies.isEmpty) {
                      // Aucun film disponible pour la catégorie sélectionnée
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.movie),
                            SizedBox(height: 10),
                            Text("Aucun film disponible pour cette catégorie"),
                          ],
                        ),
                      );
                    }
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: filteredMovies.length,
                      itemBuilder: (context, index) {
                        final movie = filteredMovies[index];
                        return GestureDetector(
                          onTap: () {
                            // Naviguer vers la page de détails du film
                            Get.to(
                              () => MovieDetail(movie: movie),
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
                                      image: CachedNetworkImageProvider(
                                          movie.image),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Text(
                                  movie.title,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  movie.category,
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                }),
              ),
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
                  scrollDirection: Axis.horizontal,
                  itemCount: controller
                      .movies.length, // Utilisez les films du contrôleur
                  itemBuilder: (context, index) {
                    final Movie movie = controller.movies[index];

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
                                          image: AssetImage(
                                            _movies[index]['image'],
                                          ),
                                          fit: BoxFit.cover)),
                                ),
                                //SizedBox(height: 10),
                                Text(
                                  _movies[index]['title'],
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  _movies[index]['categorie'],
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ),
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
