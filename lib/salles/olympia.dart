import 'package:flutter/material.dart';

class Olympia extends StatefulWidget {
  @override
  _OlympiaState createState() => new _OlympiaState();
}

class _OlympiaState extends State<Olympia> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Olympia Ouaga 2000'),
            centerTitle: true,
            titleTextStyle: const TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
            backgroundColor: Colors.blue,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () => Navigator.maybePop(context),
            ),
          ),
          body: SingleChildScrollView(
              //padding: const EdgeInsets.all(10.0),
              child: Column(
            //  mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 180,
                          child: AspectRatio(
                            aspectRatio: 1 / 1,
                            child: Image.asset('assets/images/canal.png'),
                          ),
                        ),
                      ),
                      const Text(
                        "Olympia 2000",
                        style: TextStyle(fontSize: 17),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 180,
                          child: AspectRatio(
                            aspectRatio: 1 / 1,
                            child: Image.asset('assets/images/canal.png'),
                          ),
                        ),
                      ),
                      const Text(
                        "Olympia Pissy",
                        style: TextStyle(fontSize: 17),
                      )
                    ],
                  ),
                ],
              ),
              DataTable(
                  columns: const [
                    DataColumn(label: Text("Enfant")),
                    DataColumn(label: Text("Adulte")),
                    DataColumn(label: Text("Première")),
                  ],
                  rows: List.generate(
                      3,
                      (index) =>
                          DataRow(
                            cells: [
                              DataCell(Text("1000 FCFA")),
                              DataCell(Text("2000 FCFA")),
                              DataCell(Text("5000 FCFA")),
                              ]
                          )
                  )
              ),
              const SizedBox(height: 10,),
              Container(
                //padding: const EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width - 50.0,
                child: const Text(
                    "En l’an 2154, Jake Sully, ancien marine paraplégique, accepte de participer au programme Avatar pour remplacer son frère jumeau décédé, Tom Sully. Il est envoyé sur Pandora, l’une des lunes de Polyphème, une planète géante gazeuse en orbite autour d'Alpha Centauri A.En outre, la planète est habitée par les Na'vis, une espèce indigène humanoïde qu'ils considèrent comme primitive et hostile. Pourtant, ces derniers se caractérisent par un mode de vie en totale harmonie avec la nature.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 16.0,
                        color: Colors.black)),
              ),
            ],
          ))),
    );
  }
}
