import 'package:flutter/material.dart';

import 'details/movie_detail.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> categories = [
    'Action',
    'Comedy',
    'Drama',
    'Sci-Fi',
    'Horror',
  ];

  int selectedCategoryIndex = 0;

  int selectedIndex = 0;

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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: const Text(
          'E-cinema',
        ),
        centerTitle: false,
        titleTextStyle: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: const Icon(
                Icons.store,
                size: 35,
              ),
              onPressed: () {
                /*Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                      return Cinema();
                  }));*/
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
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
                      //_showDropdown(context);
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
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
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          categories[index],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: index == selectedIndex
                                ? Colors.blue
                                : Colors.black,
                            //decoration: index == selectedIndex
                            //   ? TextDecoration.underline
                            // : TextDecoration.none,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 4),
                          height: 2,
                          width: 30,
                          color: index == selectedIndex
                              ? Colors.blue
                              : Colors.transparent,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(left: 10.0),
              scrollDirection: Axis.horizontal,
              itemCount: _movies.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    /* ListTile(
                        leading: Image.asset(
                          _movies[index]['image'],
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        title: Text(_movies[index]['title']),
                        subtitle: Text(_movies[index]['categorie']),
                        trailing: const Icon(Icons.play_arrow),
                      ),
                      SizedBox(height: 10),*/

                    InkWell(
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
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.grey[200]!,
                        ),
                        width: 300,
                        //  height: 400,

                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 280,
                              height: 400,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  image: DecorationImage(
                                      image: AssetImage(
                                        _movies[index]['image'],
                                      ),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                              width: 290,
                              height: 50,
                              // color: Colors.amber,
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
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
                                              color: Colors.grey.shade600),
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
                                              color: Colors.grey.shade600),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
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
                                              color: Colors.grey.shade600),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
