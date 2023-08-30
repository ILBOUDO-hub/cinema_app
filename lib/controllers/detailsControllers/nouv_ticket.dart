import 'package:cinema/controllers/userController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingController {
  final CollectionReference _bookingCollection =
      FirebaseFirestore.instance.collection('booking');

  final UserController userController = Get.find<UserController>();

  Future<List<DocumentSnapshot>> getUserBookings() async {
    try {
      String userPhoneNumber = userController.user?.phoneNumber ?? 'Utilisateur non connecté';
      
      QuerySnapshot querySnapshot = await _bookingCollection
          .where('phone', isEqualTo: userPhoneNumber)
          .get();

      DateTime now = DateTime.now();
      List<DocumentSnapshot> validBookings = [];

      for (DocumentSnapshot bookingSnapshot in querySnapshot.docs) {
        Map<String, dynamic> bookingData = bookingSnapshot.data() as Map<String, dynamic>;
        DateTime movieDate = bookingData['movieDate'].toDate();

        if (movieDate.isAfter(now)) {
          validBookings.add(bookingSnapshot);
        }
      }

      return validBookings;
    } catch (e) {
      print('Erreur lors de la récupération des réservations : $e');
      return [];
    }
  }
}

/*class BookingController {
  final CollectionReference _bookingCollection =
      FirebaseFirestore.instance.collection('booking');

  final UserController userController = Get.find<UserController>();

  Future<List<DocumentSnapshot>> getValidBookings() async {
    try {
      String userPhoneNumber = userController.user?.phoneNumber ?? 'Utilisateur non connecté';
      DateTime now = DateTime.now();
      QuerySnapshot querySnapshot = await _bookingCollection
          .where('phone', isEqualTo: userPhoneNumber)
          .where('movieDate', isGreaterThanOrEqualTo: now)
          .get();

      return querySnapshot.docs;
    } catch (e) {
      print('Erreur lors de la récupération des réservations : $e');
      return [];
    }
  }
}*/

/*
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
*/