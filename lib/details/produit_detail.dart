import 'package:cinema/details/payment.dart';
import 'package:cinema/details/video_player.dart';
import 'package:flutter/material.dart';

import '../models/Product.dart';

class ProduitDetail extends StatelessWidget {
  final assetPath1,
      assetPath2,
      cookieauteur,
      cookieprice,
      cookiename,
      cookiecategorie;
  //  isFavorite;
  final _controller = PageController();

  ProduitDetail({
    this.assetPath1,
    this.assetPath2,
    this.cookieauteur,
    this.cookieprice,
    this.cookiename,
    this.cookiecategorie,
    //this.isFavorite
  });

  bool isPressed = true;
  bool isPressed2 = true;
  bool isHighlighted = true;
  @override
  Widget build(BuildContext context) {
    String cookieprices = cookieprice.toString();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF545D68)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(cookiename,
            style: const TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                color: Color(0xFF545D68))),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.favorite_sharp, color: Color(0xFF545D68)),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(children: [
        //const SizedBox(height: 10.0),
        /*const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text('Action',
              style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 42.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue)),
        ),*/
        //  const SizedBox(height: 5.0),

        // page view

        Container(
          color: Colors.white,
         // height: 300,
          width: 150,
          child: Image.asset(assetPath1, fit: BoxFit.cover),
        ),

        SizedBox(
          height: 10,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Text(
                  "$cookiename",
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontFamily: 'Varela',
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Color.fromARGB(255, 83, 83, 83)),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.play_circle_rounded,
                    size: 22,
                  ),
                  onPressed: () {
                    //for (var i = 0; i < gateau.length; i++) {
                     // final gleinfo = gateau[i];
                     //Code pour récupérer le trailler du film correspondant
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PlayerDetail(
                                assetPath1: assetPath1,
                                cookieprice: cookieprice,
                                cookiename: cookiename,
                                cookieauteur: cookieauteur,
                                cookiecategorie: cookiecategorie,
                                //isFavorite: gleinfo.isFavorite,
                              )));
                  //  }
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.favorite,
                    size: 22,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(
                    Icons.location_on_sharp,
                    size: 22,
                  ),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),

        SizedBox(
          height: 10,
        ),

        Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                height: 50,
                //width: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                //color: Colors.blue,
                child: const Center(
                  child: Text(
                    "Action",
                    //"$cookiecategorie",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                height: 50,
                //   width: 50,

                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.30),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [Icon(Icons.access_alarm_sharp), Text("20:30")],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                height: 50,
                // width: 50,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.30),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(Icons.calendar_month_sharp),
                    Text("07/04/2023")
                  ],
                ),
              )
            ],
          ),
        ),

        /* Container(
           padding: const EdgeInsets.only(right: 20, left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: List.generate(
                    5,
                    (index) => Icon(
                          Icons.star,
                          size: 25.0,
                          color: index == 4 ? Colors.grey : Colors.orange,
                        )).toList().cast<Widget>(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.favorite,
                      size: 25,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.location_on_sharp,
                      size: 25,
                    ),
                    onPressed: () {},
                  ),
                ],
              )
            ],
          ),
        ),*/

        /*Container(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Text(
              "Cinéma: $cookieauteur",
              textAlign: TextAlign.start,
              style: const TextStyle(
                  fontFamily: 'Varela',
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Color.fromARGB(255, 83, 83, 83)),
            )),
        const SizedBox(height: 10.0),
        Container(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: Text("$cookieprices FCFA",
              style: const TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue)),
        ),*/

        const SizedBox(height: 10.0),

        Container(
          padding: const EdgeInsets.only(right: 20, left: 20),
          width: MediaQuery.of(context).size.width - 50.0,
          child: const Text("Synopsis",
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ),

        Container(
          padding: const EdgeInsets.all(20.0),
          width: MediaQuery.of(context).size.width - 50.0,
          child: const Text(
              "En l’an 2154, Jake Sully, ancien marine paraplégique, accepte de participer au programme Avatar pour remplacer son frère jumeau décédé, Tom Sully. Il est envoyé sur Pandora, l’une des lunes de Polyphème, une planète géante gazeuse en orbite autour d'Alpha Centauri A.En outre, la planète est habitée par les Na'vis, une espèce indigène humanoïde qu'ils considèrent comme primitive et hostile. Pourtant, ces derniers se caractérisent par un mode de vie en totale harmonie avec la nature.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontFamily: 'Varela', fontSize: 16.0, color: Colors.black)),
        ),
        //  color: Color(0xFFB4B8B9)
        //  const SizedBox(height: 10.0),
      ]),
      bottomNavigationBar: Container(
        height: 60,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          /*Container(
            //padding: const EdgeInsets.only(right: 20, left: 20),
            child: Text("2.000 FCFA",
                style: const TextStyle(
                    fontFamily: 'Varela',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue)),
          ),*/
          FloatingActionButton.extended(
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
            //icon: const Icon(Icons.message_outlined),
            backgroundColor: Colors.blue,
            onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PaymentDetail(
                                assetPath1: assetPath1,
                                cookieprice: cookieprice,
                                cookiename: cookiename,
                                cookieauteur: cookieauteur,
                                cookiecategorie: cookiecategorie,
                                //isFavorite: gleinfo.isFavorite,
                              )));
            },
          ),

                      FloatingActionButton.extended(
                        heroTag: 'trailler',
                        extendedPadding: const EdgeInsets.all(20.0),
                        label: const Text(
                          'Trailler',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        icon: const Icon(Icons.play_circle_rounded),
                        backgroundColor: Colors.blue,
                        onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PlayerDetail(
                                assetPath1: assetPath1,
                                cookieprice: cookieprice,
                                cookiename: cookiename,
                                cookieauteur: cookieauteur,
                                cookiecategorie: cookiecategorie,
                                //isFavorite: gleinfo.isFavorite,
                              )));
                        },
                      ),

        ]),
      ),
    );
  }
}
