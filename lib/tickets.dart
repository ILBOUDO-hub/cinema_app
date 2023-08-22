import 'package:cinema/tickets/ancien.dart';
import 'package:cinema/tickets/nouveau.dart';
import 'package:flutter/material.dart';

class MesTicket extends StatefulWidget {
  @override
  _MesTicketState createState() => _MesTicketState();
}

class _MesTicketState extends State<MesTicket> with TickerProviderStateMixin {
  List<String> categories = [
    'Mes tickets',
    'Historique',
  ];

  int selectedCategoryIndex = 0;
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            elevation: 2,
            title: const Text("CinePlus",),
            centerTitle: false,
            titleTextStyle: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
                          fontFamily: "Times new roman"
            ),
            backgroundColor: Colors.blue,
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.notifications_none),
                onPressed: () {
                  /*Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return Movies();
                  }));*/
                },
              ),
            ],
          ),
          body: SafeArea(
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              //padding: const EdgeInsets.only(left: 20.0),
              children: <Widget>[
                /*const SizedBox(height: 15.0),
                Container(
                  //color: Colors.amber,
                  margin: EdgeInsets.only(right: 40, left: 30),
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
                              left: 20, right: 20, top: 15, bottom: 0),
                          decoration: BoxDecoration(
                            /*border: Border.all(
                            color: selectedCategoryIndex == index ? Colors.red : Colors.transparent,
                            width: 2,
                          ),*/
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
                ),*/
                const SizedBox(height: 15.0),
                TabBar(
                  labelColor: Colors.blue,
                  labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                  unselectedLabelColor: Colors.grey,
                  controller: _tabController,
                  tabs: const <Widget>[
                    Tab(child: Text("Mes tickets")),
                    Tab(child: Text("Historique")),
                  ],
                ),
                Container(
                    height: MediaQuery.of(context).size.height - 50.0,
                    width: double.infinity,
                    child: TabBarView(controller: _tabController, children: [
                      //liste des widgets pour chaque page de categorie
                      //Boutique(),

                      Nouveau(),
                      Ancien(),
                    ])),

                     Column(
          children: [
            const SizedBox(height: 100.0),
            Container(
              height: 120.0,
              width: 120.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/tickets.png',
                  ),
                  fit: BoxFit.fill,
                ),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              "Vous n'avez pas de nouveau ticket !",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
              ],
            ),
          ),
        ));
  }
}
