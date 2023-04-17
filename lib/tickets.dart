import 'package:cinema/tickets/nouveau.dart';
import 'package:flutter/material.dart';

import 'categories/movies.dart';

class Ticket extends StatefulWidget {
  @override
  _TicketState createState() => _TicketState();
}

class _TicketState extends State<Ticket> with TickerProviderStateMixin {
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
          title: const Text('E-cinema'),
          centerTitle: false,
          titleTextStyle: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          backgroundColor: Colors.blue,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.notifications_none),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Movies();
                }));
              },
            ),
          ],
        ),
        body:  ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.only(left: 20.0),
        children: <Widget>[
        
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
                Movies(),
              ]))

          ],
   
      ),
    ));
  }
}
