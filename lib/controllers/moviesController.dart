import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cinema/models/movies.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class MoviesController extends GetxController {
  static MoviesController instance = Get.find();
  CollectionReference<Map<String, dynamic>> db =
      FirebaseFirestore.instance.collection("movies");

  FirebaseStorage _storage = FirebaseStorage.instance;

  final RxList<Movie> movies = <Movie>[].obs;
  final RxBool isLoading = false.obs;
  final RxList<Movie> selectedMovies = <Movie>[].obs;

  MoviesController();

  @override
  void onInit() {
    super.onInit();
    fetchMovies();
  }

  Future<List<Movie>> fetchMovies() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot = await db.get();
      final List<Movie> movieList = [];

      for (var doc in querySnapshot.docs) {
        final movie = Movie.fromJson(doc.data());

        // Récupérer les sous-collections "typeTicket" pour chaque film
        final QuerySnapshot<Map<String, dynamic>> typeTicketSnapshot =
            await doc.reference.collection("typeTicket").get();

        final List<TypeTicket> typeTickets = [];

        for (var ticketDoc in typeTicketSnapshot.docs) {
          final ticket = TypeTicket.fromJson(ticketDoc.data());
          typeTickets.add(ticket);
        }

        movie.typeTickets = typeTickets;

        // Vérifier si la date de fin du film n'est pas dépassée
        if (!_isMovieExpired(movie)) {
                // Récupérer l'URL de téléchargement de l'image depuis Firebase Storage
      final String downloadURL = await _storage.ref(movie.image).getDownloadURL();

      // Mettre à jour l'URL de l'image dans l'objet Movie avec une URL absolue
      movie.image = downloadURL;

      String videoURL = await _storage.ref(movie.video).getDownloadURL();
      movie.video = videoURL;

          movieList.add(movie);
        }
      }

      print(movieList);
      movies.value = movieList;
      print(movies.value.toString());

      return movieList;
    } catch (e) {
      print('Erreur lors de la récupération des films : $e');
      return []; // Retourner une liste vide en cas d'erreur
    }
  }

  bool _isMovieExpired(Movie movie) {
    final DateTime now = DateTime.now();

    // Vérifier chaque typeTicket du film
    for (final typeTicket in movie.typeTickets) {
      final DateTime dateFin = typeTicket.dateFin;
      if (now.isBefore(dateFin)) {
        return false; // Le film n'est pas expiré
      }
    }

    return true; // Le film est expiré si on n'a trouvé aucun typeTicket avec une date de fin non dépassée
  }


  Future<void> fetchMoviesByDate(DateTime selectedDate) async {
    try {
      isLoading.value = true;

      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance.collection("movies").get();

      final List<Movie> movieListDay = [];

      for (var doc in querySnapshot.docs) {
        final movie = Movie.fromJson(doc.data());

        final QuerySnapshot<Map<String, dynamic>> typeTicketSnapshot =
            await doc.reference.collection("typeTicket").get();

        final List<TypeTicket> typeTickets = [];

        for (var typeTicketDoc in typeTicketSnapshot.docs) {
          final ticket = TypeTicket.fromJson(typeTicketDoc.data());
          typeTickets.add(ticket);
        }

        movie.typeTickets = typeTickets;

        // Vérifier si la date de fin du film n'est pas dépassée
        if (!_isMovieExpired(movie)) {
          final String downloadURL =
              await FirebaseStorage.instance.ref(movie.image).getDownloadURL();
          movie.image = downloadURL;

          String videoURL =
              await FirebaseStorage.instance.ref(movie.video).getDownloadURL();
          movie.video = videoURL;

          // Filter the typeTickets by selectedDate
          final filteredTickets = movie.typeTickets.where((typeTicket) {
            return selectedDate.isAfter(typeTicket.dateDebut) &&
                selectedDate.isBefore(typeTicket.dateFin);
          }).toList();

          movie.typeTickets = filteredTickets;

          if (filteredTickets.isNotEmpty) {
            movieListDay.add(movie);
          }
        }
      }

      selectedMovies.value = movieListDay;
      isLoading.value = false;
    } catch (e) {
      print('Erreur lors de la récupération des films : $e');
    }
  }
}
