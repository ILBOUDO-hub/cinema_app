import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:get/get.dart';

import '../models/moviesTest.dart';

class TicketDetail extends StatefulWidget {
  final Movie movie;

  TicketDetail({required this.movie});

  @override
  State<TicketDetail> createState() => _TicketDetailState();
}

class _TicketDetailState extends State<TicketDetail> {
  DateTime _selectedDate = DateTime.now();
  late List<Ticket> ticketsForSelectedDate = [];

  @override
  void initState() {
    super.initState();
    filterTicketsBySelectedDate();
  }

  Future<List<Ticket>> getTicketsForMovieById(int movieId) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('tickets')
        .where('idMovies', isEqualTo: movieId)
        .get();

    final tickets = snapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return Ticket.fromJson(
          data); // Assurez-vous d'avoir une méthode pour désérialiser un Ticket depuis Map.
    }).toList();

    return tickets;
  }

  void filterTicketsBySelectedDate() async {
    final movieId = widget.movie.idMovies;
    final tickets = await getTicketsForMovieById(movieId);

    setState(() {
      ticketsForSelectedDate = tickets
          .where((ticket) =>
              ticket.dateDebut.isBefore(_selectedDate) &&
              ticket.dateFin.isAfter(_selectedDate))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFFCFAF8),
        appBar: AppBar(
          title: const Text('Mes tickets'),
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
        body: Stack(
          children: [
            ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 70.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 7,
                      itemBuilder: (BuildContext context, int index) {
                        DateTime date =
                            DateTime.now().add(Duration(days: index));
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedDate = date;
                              filterTicketsBySelectedDate();
                            });
                          },
                          child: Container(
                            width: 70.0,
                            margin: const EdgeInsets.only(right: 10.0),
                            decoration: BoxDecoration(
                              color: _selectedDate.day == date.day
                                  ? Colors.blue
                                  : Color.fromARGB(255, 220, 219, 219),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${date.day}',
                                  style: const TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5.0),
                                Text(
                                  '${_getWeekday(date.weekday)}',
                                  style: const TextStyle(fontSize: 16.0),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                if (ticketsForSelectedDate
                    .isEmpty) // Check if the list is empty
                  Center(
                    // Display an icon and message if the list is empty
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.movie,
                          size: 60,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Aucun film disponible pour cette date.",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: ticketsForSelectedDate.length,
                    itemBuilder: (BuildContext context, int index) {
                      final ticket = ticketsForSelectedDate[index];
                      return Card(
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
                                  imageUrl: widget.movie.image,
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
                                  "Prix: ${ticket.price}",
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
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.zero,
          width: Get.width,
          height: Get.height * 0.1,
          decoration: const BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(offset: Offset(0, 0), blurRadius: 10, spreadRadius: 0)
          ]),
          child: Center(
            child: Column(
              children: [
                Text(
                  'Nombre de tickets',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: MediaQuery.of(context).size.height * 0.06,
                  padding: EdgeInsets.only(left: 8, right: 8),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15)),
                  child: SpinBox(
                    iconSize: 25,
                    textStyle:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        disabledBorder: InputBorder.none),
                    min: 1,
                    max: 300,
                    value: 1,
                    onChanged: (value) {
                      print(value);
                      // qte.value = value.toInt();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getWeekday(int weekday) {
    switch (weekday) {
      case 1:
        return 'Lun';
      case 2:
        return 'Mar';
      case 3:
        return 'Mer';
      case 4:
        return 'Jeu';
      case 5:
        return 'Ven';
      case 6:
        return 'Sam';
      case 7:
        return 'Dim';
      default:
        return "Invalid day";
    }
  }
}
