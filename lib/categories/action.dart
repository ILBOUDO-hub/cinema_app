import 'package:flutter/material.dart';
import 'package:cinema/details/movie_detail.dart';

class Films extends StatefulWidget {
  @override
  State<Films> createState() => _FilmsState();
}

class _FilmsState extends State<Films> {
  final List<Map<String, dynamic>> _movies = [
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFAF8),
      body: GridView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.only(bottom: 300),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Nombre de colonnes dans la grille
          childAspectRatio:
              0.7, // Rapport largeur/hauteur des éléments de la grille
        ),
        itemCount: _movies.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              // Action à effectuer lorsqu'un film est sélectionné
              // Par exemple, afficher les informations détaillées du film
              /* showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(_movies[index]['title']),
                    content: Text(_movies[index]['description']),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Fermer'),
                      ),
                    ],
                  );
                },
              );*/

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
                    height: 200,
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
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    _movies[index]['categorie'],
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
