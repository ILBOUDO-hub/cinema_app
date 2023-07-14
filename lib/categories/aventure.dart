import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:cinema/details/movie_detail.dart';

class Aventure extends StatefulWidget {
  @override
  State<Aventure> createState() => _AventureState();
}

class _AventureState extends State<Aventure> {
  String _searchText = '';
  int _current = 0;
  dynamic _selectedIndex = {};

  CarouselController _carouselController = new CarouselController();

  final List<dynamic> _products = [
    {
      'title': 'Black Adam',
      'image': "assets/images/adam.jfif",
      'description': 'Action',
      'auteur': 'Action',
      'price': '2000'
    },
    {
      'title': 'Black Panthere',
      'image': "assets/images/panther.jfif",
      'description': 'Action',
      'auteur': 'Black Widow',
      'price': '2000'
    },
    {
      'title': 'Astérix',
      'image': "assets/images/asterix.jfif",
      'description': 'Animation',
      'auteur': 'Black Widow',
      'price': '2000'
    },
    {
      'title': 'Age Of Ultron',
      'image': "assets/images/avengers.jfif",
      'description': 'Action',
      'auteur': 'Black Widow',
      'price': '2000'
    },
    {
      'title': 'Demon Slayer',
      'image': "assets/images/demon.jfif",
      'description': 'Godzilla Vs Kong',
      'auteur': 'Anime',
      'price': '2000'
    },
    {
      'title': 'Avatar',
      'image': "assets/images/avatar.jfif",
      'description': 'Godzilla Vs Kong',
      'auteur': 'Science-Fiction',
      'price': '2000'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          /*const SizedBox(height: 20.0),

            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    width: 300,
                    child: TextFormField(
              decoration: InputDecoration(
                labelText: "Rechercher ici...",
                prefixIcon: Icon(Icons.search),
                                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.filter_list),
                ],
              ),
            ),*/

          SingleChildScrollView(
        child: Column(
          children: [
            /*Container(
              // margin: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(10.0)),
                color: Colors.blue,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10.0),
                        bottom: Radius.circular(10.0)),
                    color: const Color.fromARGB(255, 222, 9, 9),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: Icon(Icons.mic),
                      border: InputBorder.none,
                      hintText: 'Search',
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                    ),
                  ),
                ),
              ),
            ),*/

            const SizedBox(height: 10.0),
            const Text(
              'Actuellement en salle',
              style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 21.0,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              width: double.infinity,
              //height: double.infinity,
              child: CarouselSlider(
                  carouselController: _carouselController,
                  options: CarouselOptions(
                      height: 450.0,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.70,
                      enlargeCenterPage: true,
                      pageSnapping: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                  items: _products.map((movie) {
                    return Builder(
                      builder: (BuildContext context) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (_selectedIndex == movie) {
                                _selectedIndex = {};
                              } else {
                                _selectedIndex = movie;
                              }
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: _selectedIndex == movie
                                    ? Border.all(
                                        color: Colors.blue.shade500, width: 3)
                                    : null,
                                boxShadow: _selectedIndex == movie
                                    ? [
                                        BoxShadow(
                                            color: Colors.blue.shade100,
                                            blurRadius: 30,
                                            offset: Offset(0, 10))
                                      ]
                                    : [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            blurRadius: 20,
                                            offset: Offset(0, 5))
                                      ]),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MovieDetail(
                                      imagePath: movie['image'],
                                      price: movie['price'],
                                      title: movie['title'],
                                      author: movie['auteur'],
                                      categorie: movie['description'],
                                      //isFavorite: gleinfo.isFavorite,
                                    ),
                                  ),
                                );
                              },
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Container(
                                      height: 320,
                                      margin: EdgeInsets.only(top: 10),
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Image.asset(movie['image'],
                                          fit: BoxFit.cover),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      movie['title'],
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      movie['description'],
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey.shade600),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
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
                                        Row(
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
                                                  color: Colors.grey.shade600),
                                            )
                                          ],
                                        ),
                                        SizedBox(
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
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }).toList()),
            ),
          ],
        ),
      ),
      //],
      //),
    );
  }
}
