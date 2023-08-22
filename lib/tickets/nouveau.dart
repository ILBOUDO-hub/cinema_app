import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema/controllers/detailsControllers/nouv_ticket.dart';
import 'package:cinema/controllers/moviesTest.dart';
import 'package:cinema/models/moviesTest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class Nouveau extends StatelessWidget {
  final NouveauController nouveauController = Get.find<NouveauController>();
  final MoviesController moviesController = Get.find<MoviesController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFAF8),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 100.0),
            Obx(() {
              if (nouveauController.isLoading.value) {
                return const CircularProgressIndicator();
              } else {
                if (nouveauController.userTickets.isEmpty) {
                  return const Text("Vous n'avez pas de ticket");
                } else {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: nouveauController.userTickets.length,
                    itemBuilder: (BuildContext context, int index) {
                      final ticket = nouveauController.userTickets[index];
                      final associatedMovie =
                          moviesController.movies.firstWhere(
                        (movie) => movie.idMovies == ticket.idMovies,
                        // orElse: () => Movie(idMovies: -1, image: '')
                      );

                      return InkWell(
                        onTap: () {
                          // TODO: Naviguer vers la page de détails du ticket
                        },
                        child: Card(
                          elevation: 1.0,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: associatedMovie.image,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) =>
                                        const SpinKitCircle(
                                      color: Colors.blue,
                                      size: 50.0,
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    ticket.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Prix: ${ticket.time}",
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.blueAccent,
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Icon(Icons.watch_later_outlined),
                                          Text(
                                            ticket.time.toString(),
                                            style:
                                                const TextStyle(fontSize: 16),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              }
            }),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
