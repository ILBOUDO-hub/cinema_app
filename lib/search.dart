import 'package:flutter/material.dart';
import 'package:cinema/controllers/moviesTest.dart';
import 'package:cinema/models/moviesTest.dart';
import 'package:get/get.dart';

import 'details/movie_detail.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  MoviesController moviesController = MoviesController.instance;
  TextEditingController searchController = TextEditingController();
  List<Movie> searchResults = [];

  void searchMovies(String searchTerm) {
    final lowerCaseSearchTerm = searchTerm.toLowerCase();
    setState(() {
      searchResults = moviesController.movies
          .where((movie) => movie.title.toLowerCase().contains(lowerCaseSearchTerm))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recherche de Films'),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(5.0),
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
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  //prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  hintText: 'Rechercher selon le titre du film',
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 8.0,
                  ),
                ),
                onSubmitted: (searchTerm) {
                  searchMovies(searchTerm);
                },
              ),
            ),
          ),
          Expanded(
            child: searchResults.isEmpty
                ? const Center(
                    child: Text('Aucun film trouvé.', style: TextStyle(fontSize: 20),),
                  )
                : ListView.builder(
                    itemCount: searchResults.length,
                    itemBuilder: (BuildContext context, int index) {
                      final movie = searchResults[index];
                      return InkWell(
                        onTap: () {
                          Get.to(() => MovieDetail(movie: movie));
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
                                    borderRadius: BorderRadius.circular(10.0),
                                    image: DecorationImage(
                                      image: NetworkImage(movie.image),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    movie.title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    movie.category.toString(),
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    movie.room,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
