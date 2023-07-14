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

  MoviesController();

  @override
  void onInit() {
    super.onInit();
    fetchMovies();
  }

  fetchMovies() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot = await db.get();
      final List<Movie> movieList = [];

      for (var doc in querySnapshot.docs) {
        final movie = Movie.fromJson(doc.data());

        // Récupérer l'URL de téléchargement de l'image depuis Firebase Storage
        final String downloadURL =
            await _storage.ref(movie.image).getDownloadURL();

        // Mettre à jour l'URL de l'image dans l'objet Movie
        movie.image = downloadURL;

        String videoURL = await _storage.ref(movie.video).getDownloadURL();
        movie.video = videoURL;

        movieList.add(movie);
      }

      print(movieList);
      movies.value = movieList;
      print(movies.value.toString());
    } catch (e) {
      print('Erreur lors de la récupération des films : $e');
    }
  }
}
