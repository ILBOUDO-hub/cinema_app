import 'package:cinema/details/commentaire.dart';
import 'package:cinema/details/ticket_detail.dart';
import 'package:cinema/details/video_player.dart';
import 'package:cinema/models/movies.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;

  MovieDetail({super.key, required this.movie});

  bool isPressed = true;
  bool isPressed2 = true;
  bool isHighlighted = true;
  @override
  Widget build(BuildContext context) {
    Rx<DateTime> _selectedDate = Rx<DateTime>(DateTime.now());
    final _availableTimes = RxList<String>([
      '10:00',
      '11:00',
      '12:00',
      '13:00'
    ]); //Liste des heures de projections disponibles
    final _selectedTime =
        _availableTimes[0].obs; //Selectionne le premier element par defaut

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            foregroundDecoration: const BoxDecoration(color: Colors.black26),
            width: double.infinity,
            child: Image.network(movie.image),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 250),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    movie.title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: <Widget>[
                    const SizedBox(width: 16.0),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: const Text(
                        "8.4/85 Avis",
                        style: TextStyle(color: Colors.white, fontSize: 13.0),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        IconButton(
                          color: Colors.white,
                          icon: const Icon(Icons.favorite_border),
                          onPressed: () {},
                        ),
                        IconButton(
                          color: Colors.white,
                          icon: const Icon(Icons.share_rounded),
                          onPressed: () {},
                        ),
                      ],
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                    Icon(
                                      Icons.star_border,
                                      color: Colors.yellow,
                                    ),
                                  ],
                                ),
                                Text.rich(
                                  TextSpan(children: [
                                    const WidgetSpan(
                                        child: Icon(
                                      Icons.location_on,
                                      size: 16.0,
                                      color: Colors.grey,
                                    )),
                                    TextSpan(text: movie.room)
                                  ]),
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 12.0),
                                )
                              ],
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                movie.price,
                                style: const TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              const Text(
                                "/par séance",
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.grey),
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 30.0),
                      Container(
                        //padding: EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("36 Commentaires",
                                style: TextStyle(
                                    fontFamily: 'Varela',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                    color: Colors.black)),
                            TextButton(
                              onPressed: () {
                                Get.to(() => CommentPage(movieId: movie.title));
                              },
                              child: Text(
                                'Voir plus', // Le texte à afficher dans le bouton
                                style: TextStyle(
                                  fontSize: 16.0, // La taille du texte
                                  fontWeight: FontWeight
                                      .bold, // Le poids du texte (gras)
                                  color: Colors.blue, // La couleur du texte
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Text(
                        "Synopsis".toUpperCase(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20.0),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        movie.description,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: const Text(
                "",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
              ),
            ),
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: IconButton(
              color: Colors.white,
              icon: const Icon(
                Icons.play_circle_outlined,
                size: 60,
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => VideoPlayerScreen(
                          imagePath: movie.image,
                          price: movie.price,
                          title: movie.title,
                          room: movie.room,
                          description: movie.description,
                          urlvideo: movie.video,
                          //isFavorite: gleinfo.isFavorite,
                        )));
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding:
            const EdgeInsets.only(right: 40, left: 40, top: 10, bottom: 10),
        height: 70,
        width: 60,
        //color: Colors.amber,
        child: FloatingActionButton.extended(
          heroTag: 'btn1',
          extendedPadding: const EdgeInsets.all(33.0),
          label: const Text(
            'Payer un ticket',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blue,
          onPressed: () {
            Get.to(() => TicketDetail(movie: movie));
          },
        ),
      ),
    );
  }
}
