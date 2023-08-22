import 'package:cinema/controllers/userController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class NouveauController extends GetxController {
  final UserController userController = Get.find<UserController>();
  final isLoading = true.obs;
  final userTickets = <Ticket>[].obs;

  Future<void> fetchUserTickets() async {
    try {
      isLoading.value = true;

      QuerySnapshot bookingSnapshot = await FirebaseFirestore.instance
          .collection('booking')
          .where('phone', isEqualTo: userController.user?.phoneNumber ?? "")
          .get();

      List<String> bookedTicketIds = bookingSnapshot.docs
          .map((bookingDoc) => bookingDoc['idMovies'] as String)
          .toList();

      userTickets.clear();

      for (String idMovies in bookedTicketIds) {
        DocumentSnapshot ticketSnapshot = await FirebaseFirestore.instance
            .collection('tickets')
            .doc(idMovies)
            .get();

        if (ticketSnapshot.exists) {
          Ticket ticket = Ticket.fromSnapshot(ticketSnapshot);
          userTickets.add(ticket);
        }
      }
    } catch (error) {
      print('Erreur lors de la récupération des tickets: $error');
    } finally {
      isLoading.value = false;
    }
  }
}

class Ticket {
  final int idMovies;
  final String name;
  final String time;

  Ticket({
    required this.idMovies,
    required this.name,
    required this.time,
  });

  factory Ticket.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return Ticket(
      idMovies: data['idMovies'] as int,
      name: data['name'] as String,
      time: data['time'] as String,
    );
  }
}
