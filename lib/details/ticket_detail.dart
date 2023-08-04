import 'package:cinema/details/payment.dart';
import 'package:cinema/models/movies.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cinema/controllers/moviesController.dart';
import 'package:cinema/details/movie_detail.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class TicketDetail extends StatefulWidget {
  final Movie movie;
  int quantity;

  TicketDetail({required this.movie, this.quantity = 1});

  @override
  State<TicketDetail> createState() => _TicketDetailState();
}

class _TicketDetailState extends State<TicketDetail>
    with TickerProviderStateMixin {
  MoviesController moviesController = MoviesController.instance;
  DateTime _selectedDate = DateTime.now();
  Ticket? _selectedTicket;

  @override
  void initState() {
    super.initState();
    _onDateSelected(DateTime.now());
  }

  Future<void> _onDateSelected(DateTime selectedDate) async {
    try {
      await moviesController.fetchMoviesByDateTicket(selectedDate);
    } catch (e) {
      print(
          'Erreur lors de la récupération des films pour la date sélectionnée : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFAF8),
      appBar: AppBar(
        elevation: 2,
        title: const Text("Mes tickets"),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontFamily: "Times new roman",
        ),
        backgroundColor: Colors.blue,
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
                      DateTime date = DateTime.now().add(Duration(days: index));
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedDate = date;
                          });
                          moviesController.updateSelectedDate(
                              date); // Mettre à jour la date sélectionnée dans le contrôleur
                          _onDateSelected(date);
                        },
                        child: Container(
                          width: 70.0,
                          margin: const EdgeInsets.only(right: 10.0),
                          decoration: BoxDecoration(
                            color: _selectedDate.day == date.day
                                ? Colors.blue
                                : const Color.fromARGB(255, 220, 219, 219),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${date.day}',
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
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
              Container(
                margin: const EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width - 20.0,
                child: Obx(() {
                  if (moviesController.isLoading.value) {
                    return const Center(
                      child: SpinKitFadingCircle(
                        color: Colors.blue,
                        size: 50.0,
                      ),
                    );
                  } else if (moviesController.selectedMovies.isEmpty) {
                    // Afficher un message si aucun film ne correspond à la date sélectionnée
                    return const Center(
                      child: Text(
                        "Aucun ticket disponible pour cette date.",
                        style: TextStyle(fontSize: 16),
                      ),
                    );
                  } else {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: widget.movie.typeTickets
                          .length, // Utilisez widget.movie.typeTickets.length au lieu de widget.movie.typeTickets
                      itemBuilder: (BuildContext context, int index) {
                        TypeTicket ticket = widget.movie.typeTickets[
                            index]; // Récupérez le ticket à l'index donné
                        return InkWell(
                          onTap: () {
                            // Get.to(() => MovieDetail(movie: widget.movie));
                            Get.to(() => PaymentDetail(
                                  movie: widget.movie,
                                  quantity: widget.quantity,
                                  //selectedTicket: _selectedTicket!,
                                ));
                          },
                          child: Card(
                            elevation: 1.0,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      image: DecorationImage(
                                        image: NetworkImage(widget.movie.image),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.movie.title,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Prix: ${widget.movie.price}",
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                                                        const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "${widget.quantity} Ticket(s)",
                                      style: const TextStyle(fontSize: 16),
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
                }),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      setState(() {
                        if (widget.quantity > 1) {
                          widget.quantity--;
                        }
                      });
                    },
                  ),
                  Text(
                    '${widget.quantity}',
                    style: const TextStyle(fontSize: 20.0),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        widget.quantity++;
                      });
                    },
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_selectedTicket != null) {
                        // Afficher la page de paiement avec le ticket sélectionné et la quantité
                        Get.to(() => PaymentDetail(
                              movie: widget.movie,
                              quantity: widget.quantity,
                              // selectedTicket: _selectedTicket!,
                            ));
                      } else {
                        // Afficher un message si aucun ticket n'est disponible pour le film sélectionné
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Aucun ticket disponible'),
                              content: const Text(
                                  'Aucun ticket n\'est disponible pour ce film à la date sélectionnée.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: Text(
                        'Réserver',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
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
        return '';
    }
  }
}

class Ticket {
  final String ticketTitle;
  int quantity;

  Ticket({required this.ticketTitle, this.quantity = 1});
}
