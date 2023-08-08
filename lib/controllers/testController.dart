import 'package:cinema/models/movies.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class MoviesController extends GetxController {
  final CollectionReference moviesCollection =
      FirebaseFirestore.instance.collection('movies');

  RxBool isLoading = true.obs;
  RxBool hasError = false.obs; // Propriété pour suivre les erreurs
  RxString errorMessage = ''.obs; // Propriété pour stocker le message d'erreur
  RxList<Movie> movies = <Movie>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    try {
      QuerySnapshot moviesSnapshot = await moviesCollection.get();
      List<Movie> loadedMovies = [];

      for (QueryDocumentSnapshot movieDoc in moviesSnapshot.docs) {
        List<TypeTicket> typeTickets = [];

        QuerySnapshot ticketsSnapshot = await movieDoc.reference
            .collection('typeTickets')
            .orderBy('dateDebut', descending: false)
            .get();

        for (QueryDocumentSnapshot ticketDoc in ticketsSnapshot.docs) {
          typeTickets.add(TypeTicket.fromJson(
              ticketDoc.data() as Map<String, dynamic>));
        }

        Movie movie = Movie.fromJson({
          ...movieDoc.data() as Map<String, dynamic>,
          'typeTickets': typeTickets,
        } as Map<String, dynamic>);

        loadedMovies.add(movie);
      }

      movies.value = loadedMovies;
      hasError.value = false; // Pas d'erreur
    } catch (error) {
      print(error);
      hasError.value = true; // Il y a une erreur
      errorMessage.value = 'Une erreur s\'est produite lors du chargement des films.';
    } finally {
      isLoading.value = false;
    }
  }
}
