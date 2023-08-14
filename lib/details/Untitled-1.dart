import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'controllers/moviesController.dart';
import 'details/movie_detail.dart';
import 'models/movies.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Welcome extends StatelessWidget {
  final MoviesController myController = Get.put(MoviesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // ... (Le reste du code reste inchangé)

              // Utilisation du GetBuilder pour observer les changements du contrôleur
              GetBuilder<MoviesController>(
                builder: (controller) {
                  if (controller.isLoading) {
                    // Afficher une indication de chargement
                    return SpinKitCircle(
                      color: Colors.blue,
                      size: 50.0,
                    );
                  } else if (controller.hasError) {
                    // Afficher un message d'erreur si une erreur s'est produite
                    return Text('Erreur: ${controller.errorMessage}');
                  } else {
                    // Afficher la liste des films
                    return ListView.builder(
                      //padding: EdgeInsets.only(left: 10.0),
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.movies.length,
                      itemBuilder: (context, index) {
                        final movie = controller.movies[index];
                        return GestureDetector(
                          onTap: () {
                            Get.to(MovieDetail(movie: movie));
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
                                      // Utilisation de l'image en cache
                                      image: AssetImage(movie.image),
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
              // ...
            ],
          ),
        ),
      ),
    );
  }
}
