//import 'package:cinema/categories/movies.dart';
import 'package:cinema/controllers/moviesController.dart';
import 'package:cinema/controllers/ticketController.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:cinema/details/movie_detail.dart';
import 'models/movies.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
    // Déclarez le contrôleur d'onglet ici
 // final TicketDetailController ticketDetailController =
   // Get.put(TicketDetailController());

      
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
  List<String> selectedCategories = [
    'Africain',
    'Comedie',
    'Romance',
  ];

  int selectedIndex = 0;

  late int selectedCategoryIndex;
  //late List<String> selectedCategories;

  @override
  void initState() {
    super.initState();
    fetchUserPreferences();
    selectedCategoryIndex = categories.indexOf('Recommandé');
    print(selectedCategoryIndex);
  }

  List<Movie> getFilteredMovies() {
    if (categories[selectedCategoryIndex] == 'Recommandé') {
      return myController.movies
          .where(
              (movie) => selectedCategories?.contains(movie.category) ?? false)
          .toList();
    } else {
      return myController.movies
          .where((movie) => movie.category == categories[selectedCategoryIndex])
          .toList();
    }
  }

  void fetchUserPreferences() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection(
            'users') // Mettez à jour avec le nom de votre collection d'utilisateurs
        .doc(uid)
        .get();

    if (snapshot.exists) {
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      if (data.containsKey('preferences')) {
        setState(() {
          selectedCategories = List<String>.from(data['preferences']);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
              // ...
              const SizedBox(height: 10.0),
              Container(
                height: 310,
                child: FutureBuilder(
                  future: myController.fetchMovies(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // Afficher une indication de chargement
                      return SpinKitCircle(
                        color: Colors.blue,
                        size: 50.0,
                      );
                    } else if (snapshot.hasError) {
                      // Afficher un message d'erreur si une erreur s'est produite
                      return Text('Erreur: ${snapshot.error}');
                    } else {
                      // Afficher la liste des films filtrés
                      if (getFilteredMovies().isEmpty) {
                        return Column(
                          children: [
                            Center(
                              child: Image.asset(
                                'assets/images/VR.png',
                                width: 200,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "Films indisponibles pour le moment",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        );
                      } else {
                        return ListView.builder(
                          //padding: EdgeInsets.only(left: 10.0),
                          scrollDirection: Axis.horizontal,
                          itemCount: getFilteredMovies().length,
                          itemBuilder: (context, index) {
                            final movie = getFilteredMovies()[index];
                            return GestureDetector(
                              onTap: () {
                                Get.to(MovieDetail(movie: movie));
                                /*Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MovieDetail(
                                      imagePath: movie.image,
                                      price: movie.price,
                                      title: movie.title,
                                      room: movie.room,
                                      description: movie.description,
                                      categorie: movie.category,
                                      urlvideo: movie.video,
                                    ),
                                  ),
                                );*/
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
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        image: DecorationImage(
                                          image: NetworkImage(movie.image),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      movie.title,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      movie.category,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                    }
                  },
                ),
              ),
              // ...

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

              const SizedBox(height: 10.0),
              Container(
                height: 310,
                child: FutureBuilder(
                  future: myController.fetchMovies(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // Afficher une indication de chargement
                      return SpinKitCircle(
                        color: Colors.blue,
                        size: 50.0,
                      );
                    } else if (snapshot.hasError) {
                      // Afficher un message d'erreur si une erreur s'est produite
                      return Text('Erreur: ${snapshot.error}');
                    } else {
                      // Afficher la liste des films
                      return ListView.builder(
                        //padding: EdgeInsets.only(left: 10.0),
                        scrollDirection: Axis.horizontal,
                        itemCount: myController.movies.length,
                        itemBuilder: (context, index) {
                          final movie = myController.movies[index];
                          return GestureDetector(
                            onTap: () {
                                Get.to(MovieDetail(movie: movie));
                              /*Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MovieDetail(
                                    imagePath: movie.image,
                                    price: movie.price,
                                    title: movie.title,
                                    room: movie.room,
                                    description: movie.description,
                                    categorie: movie.category,
                                    urlvideo: movie.video,
                                  ),
                                ),
                              );*/
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
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    movie.title,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    movie.category,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
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
