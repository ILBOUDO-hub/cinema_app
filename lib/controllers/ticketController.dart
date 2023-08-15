import 'package:get/get.dart';
import '../models/moviesTest.dart';

class TicketsController extends GetxController {
  static TicketsController get instance => Get.find();

  // Liste des tickets
  var tickets = <Ticket>[
    // ... Vos tickets existants
  ].obs;

  // Méthode pour obtenir les tickets disponibles pour un film donné
  List<Ticket> getTicketsForMovie(int movieId) {
    return tickets.where((ticket) => ticket.idMovies == movieId).toList();
  }
}
