import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cinema/models/moviesTest.dart';
import 'package:firebase_storage/firebase_storage.dart';

class MoviesController extends GetxController {
  RxList<Movie> movies = RxList<Movie>();
  RxList<Movie> selectedMovies = RxList<Movie>();
  static MoviesController instance = Get.find();
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final RxBool isLoading = false.obs;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await firestore.collection('movies').get();
    final List<Movie> upcomingMovies = [];

    final DateTime today = DateTime.now();

    for (final doc in querySnapshot.docs) {
      final Movie movie = Movie.fromJson(doc.data());

      // Fetch ticket using idMovies
      final QuerySnapshot<Map<String, dynamic>> ticketSnapshot = await firestore
          .collection('tickets')
          .where('idMovies', isEqualTo: movie.idMovies)
          .get();

      if (ticketSnapshot.docs.isNotEmpty) {
        final Ticket ticket = Ticket.fromJson(ticketSnapshot.docs.first.data());

        if (ticket.dateFin.isAfter(today)) {
          final imageRef = _storage.ref(movie.image);
          final videoRef = _storage.ref(movie.video);

          try {
            final imageDownloadURL = await imageRef.getDownloadURL();
            final videoDownloadURL = await videoRef.getDownloadURL();

            // Mettre à jour les URLs de l'image et de la vidéo dans l'objet Movie avec les URLs absolues
            movie.image = imageDownloadURL;
            movie.video = videoDownloadURL;

            upcomingMovies.add(movie);
          } catch (error) {
            print(
                'Erreur lors du téléchargement de l\'image ou de la vidéo : $error');
          }
        }
      }
    }
    movies.value = upcomingMovies;
  }

  Future<void> fetchCalendrier(DateTime selectedDate) async {
    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await firestore.collection('movies').get();
    final List<Movie> comingMovies = [];

    final DateTime today = DateTime.now();

    for (final doc in querySnapshot.docs) {
      final Movie movie = Movie.fromJson(doc.data());

      // Fetch ticket using idMovies
      final QuerySnapshot<Map<String, dynamic>> ticketSnapshot = await firestore
          .collection('tickets')
          .where('idMovies', isEqualTo: movie.idMovies)
          .get();

      if (ticketSnapshot.docs.isNotEmpty) {
        final Ticket ticket = Ticket.fromJson(ticketSnapshot.docs.first.data());

        if (ticket.dateFin.isAfter(today) &&
            ticket.dateFin.isAfter(selectedDate)) {
          final imageRef = _storage.ref(movie.image);
          final videoRef = _storage.ref(movie.video);

          try {
            final imageDownloadURL = await imageRef.getDownloadURL();
            final videoDownloadURL = await videoRef.getDownloadURL();

            // Mettre à jour les URLs de l'image et de la vidéo dans l'objet Movie avec les URLs absolues
            movie.image = imageDownloadURL;
            movie.video = videoDownloadURL;

            comingMovies.add(movie);
          } catch (error) {
            print(
                'Erreur lors du téléchargement de l\'image ou de la vidéo : $error');
          }
        }
      }
    }
    selectedMovies.value = comingMovies;
  }
}
