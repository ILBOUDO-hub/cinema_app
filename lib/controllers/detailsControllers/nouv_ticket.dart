import 'package:cinema/controllers/userController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class NouveauController extends GetxController {
  final UserController userController = Get.find<UserController>();
  final CollectionReference bookingRef =
      FirebaseFirestore.instance.collection('booking');
  final CollectionReference ticketRef =
      FirebaseFirestore.instance.collection('tickets');

  Rx<List<Ticket>> userTickets = Rx<List<Ticket>>([]);

  @override
  void onInit() {
    super.onInit();
    fetchUserTickets();
  }

  Future<void> fetchUserTickets() async {
    final currentUser = userController.user?.phoneNumber;
    if (currentUser != null) {
      final bookingsSnapshot =
          await bookingRef.where('phone', isEqualTo: currentUser).get();

      final bookingDocs = bookingsSnapshot.docs;

      if (bookingDocs.isNotEmpty) {
        final userTicketIds = bookingDocs[0]['idTicket'] as List<dynamic>;

        final userTicketsData = await Future.wait(
          userTicketIds.map((ticketId) async {
            final ticketSnapshot = await ticketRef.doc(ticketId).get();
            if (ticketSnapshot.exists) {
              return Ticket.fromMap(
                  ticketSnapshot.data() as Map<String, dynamic>);
            }
            return null;
          }),
        );
        userTickets.value = userTicketsData
            .where((ticket) => ticket != null)
            .toList()
            .cast<Ticket>();
      }
    }
  }
}

class Ticket {
  final String idMovies;
  final String phone;
  final String name;
  final String time;
  // ... d'autres propriétés de Ticket

  Ticket({
    required this.idMovies,
    required this.phone,
    required this.name,
    required this.time,
    // ... autres propriétés de Ticket
  });

  factory Ticket.fromMap(Map<String, dynamic> map) {
    return Ticket(
      idMovies: map['idMovies'] ?? '',
      phone: map['phone'] ?? '',
      name: map['name'] ?? '',
      time: map['time'] ?? '',
      // ... initialisez d'autres propriétés de Ticket à partir du map
    );
  }
}
