import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../models/users.dart';

class UserController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _usersRef =
      FirebaseFirestore.instance.collection('users');

  Rx<CustomUser?> _firebaseUser = Rx<CustomUser?>(null);
  CustomUser? get user => _firebaseUser.value;

  @override
  void onInit() {
    super.onInit();
    _firebaseUser.bindStream(_auth.authStateChanges().asyncExpand((user) {
      if (user != null) {
        return _usersRef
            .where('phone', isEqualTo: user.phoneNumber)
            .snapshots()
            .map((snapshot) => snapshot.docs)
            .map((docs) {
          if (docs.isNotEmpty) {
            // Récupérez le tableau de préférences
            final preferences = docs[0]['preferences'] as List<dynamic>;
            return CustomUser(
              phoneNumber: user.phoneNumber ?? '',
              lastName: docs[0]['lastName'] ?? '',
              preferences: preferences.cast<
                  String>(), // Assurez-vous que les préférences sont des chaînes
            );
          }
          return null;
        });
      } else {
        return Stream.value(null);
      }
    }));
  }

  Future<void> updateUserPhoneNumber(String phoneNumber) async {
    // ...
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
