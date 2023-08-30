import 'package:cinema/controllers/userController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpiredBookingController {
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

        if (movieDate.isBefore(now)) {
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
