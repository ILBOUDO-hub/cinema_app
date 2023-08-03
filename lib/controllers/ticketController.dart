/*import 'package:get/get.dart';
import 'package:cinema/models/movies.dart';

class TicketController extends GetxController {
  static TicketController instance = Get.find();

  Rx<DateTime> selectedDate = DateTime.now().obs;
  RxBool isLoading = false.obs;
  RxList<Movie> selectedMovies = <Movie>[].obs;
  RxInt quantity = 1.obs;
  Ticket? selectedTicket;

  @override
  void onInit() {
    super.onInit();
    fetchMoviesByDateTicket(selectedDate.value);
  }

  Future<void> fetchMoviesByDateTicket(DateTime selectedDate) async {
    try {
      isLoading.value = true;
      selectedMovies.clear();

      // Supposez que vous ayez une liste de films disponibles dans movies (votre collection de films)

      // Filtrez les films disponibles pour la date sélectionnée
      // Utilisez votre propre logique pour filtrer les films en fonction des tickets disponibles pour la date sélectionnée.
      // Dans l'exemple ci-dessous, nous supposerons que tous les films ayant au moins un ticket disponible pour la date sélectionnée sont ajoutés à selectedMovies.

      for (final movie in movies) {
        final ticketsAvailableForDate = movie.typeTickets.where((ticket) =>
            !ticket.dateDebut.isBefore(selectedDate) &&
            !ticket.dateDebut.isAfter(selectedDate));

        if (ticketsAvailableForDate.isNotEmpty) {
          selectedMovies.add(movie);
        }
      }

      // Assurez-vous que la liste est triée par date de début du film si nécessaire.
      selectedMovies.sort((a, b) {
        final aDate = a.typeTickets.first.dateDebut;
        final bDate = b.typeTickets.first.dateDebut;
        return aDate.compareTo(bDate);
      });

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print('Erreur lors de la récupération des films par date : $e');
    }
  }

  void setSelectedDate(DateTime selectedDate) {
    this.selectedDate.value = selectedDate;
    fetchMoviesByDateTicket(selectedDate);
  }

  void incrementQuantity() {
    quantity.value++;
  }

  void decrementQuantity() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }
}
*/