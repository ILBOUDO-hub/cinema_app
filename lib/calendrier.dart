import 'package:cinema/details/movie_detail.dart';
import 'package:flutter/material.dart';
import 'package:cinema/controllers/moviesTest.dart';

import 'package:cinema/models/moviesTest.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class Calendar extends StatefulWidget {
  final List<String> _items = [
    'Tous',
    'Canal Olympia Ouaga 2000',
    'Canal Olympia Pissy',
    'Ciné Burkina',
    'Ciné Nerwaya',
  ];

  Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  MoviesController moviesController = MoviesController.instance;
  String _selectedItem = 'Tous';
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    fetchMoviesAndCalendrier();
  }

  Future<void> fetchMoviesAndCalendrier() async {
    await fetchMovies(); // Fetch all movies
    moviesController.fetchCalendrier(_selectedDate); // Fetch movies for selected date
  }

  Future<void> fetchMovies() async {
    await moviesController.fetchMovies();
    setState(() {});
  }

  void _onDateSelected(DateTime selectedDate) {
    setState(() {
      _selectedDate = selectedDate;
    });
    moviesController.fetchCalendrier(selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFAF8),
      appBar: AppBar(
        elevation: 2,
        title: const Text("CinePlus"),
        centerTitle: false,
        automaticallyImplyLeading: false,
        titleTextStyle: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: "Times new roman"),
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
              SizedBox(
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        size: 35,
                      ),
                      onPressed: () {
                        _showDropdown(context);
                      },
                    ),
                    const SizedBox(width: 10.0),
                    Text(_selectedItem),
                  ],
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
                        "Aucun film disponible pour cette date.",
                        style: TextStyle(fontSize: 16),
                      ),
                    );
                  } else {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: moviesController.selectedMovies.length,
                      itemBuilder: (BuildContext context, int index) {
                        Movie movie = moviesController.selectedMovies[index];
                        return InkWell(
                          onTap: () {
                            Get.to(() => MovieDetail(movie: movie));
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
                                        image: NetworkImage(movie.image),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      movie.title,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      movie.category.toString(),
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      movie.room,
                                      style: const TextStyle(fontSize: 14),
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
        ],
      ),
    );
  }

  String _getWeekday(int weekday) {
    switch (weekday) {
      case DateTime.monday:
        return 'Lun';
      case DateTime.tuesday:
        return 'Mar';
      case DateTime.wednesday:
        return 'Mer';
      case DateTime.thursday:
        return 'Jeu';
      case DateTime.friday:
        return 'Ven';
      case DateTime.saturday:
        return 'Sam';
      case DateTime.sunday:
        return 'Dim';
      default:
        return "Invalid day";
    }
  }

  void _showDropdown(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget._items.length,
              itemBuilder: (BuildContext context, int index) {
                String item = widget._items[index];
                return ListTile(
                  title: Text(item),
                  onTap: () {
                    setState(() {
                      _selectedItem = item;
                    });
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}