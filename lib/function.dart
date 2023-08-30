import 'package:cinema/login/user.dart';
import 'package:cinema/sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'main.dart';

final _auth = FirebaseAuth.instance;
void authWithPhoneNumber(String phone,
    {required Function(String value, int? value1) onCodeSend,
    required Function(PhoneAuthCredential value) onAutoVerify,
    required Function(FirebaseAuthException value) onFailed,
    required Function(String value) autoRetrieval}) async {
  _auth.verifyPhoneNumber(
    phoneNumber: phone,
    timeout: const Duration(seconds: 20),
    verificationCompleted: onAutoVerify,
    verificationFailed: onFailed,
    codeSent: onCodeSend,
    codeAutoRetrievalTimeout: autoRetrieval,
  );
}

Future<void> validateOtp(
    String smsCode, String verificationId, String phoneNumber) async {
  final _credential = PhoneAuthProvider.credential(
      verificationId: verificationId, smsCode: smsCode);

  try {
    await _auth.signInWithCredential(_credential);

    // Utilisateur authentifié avec succès, enregistrons le numéro de téléphone dans la collection "users"
    final usersRef = FirebaseFirestore.instance.collection('users');

    // Vérifions d'abord si l'utilisateur existe déjà dans la collection "users"
    final userQuery =
        await usersRef.where('phone', isEqualTo: phoneNumber).get();
    if (userQuery.docs.isEmpty) {
      Get.to(UserPage(
        phoneNumber: phoneNumber,
      ));
    } else {
      // Redirigeons l'utilisateur vers la page HomePage
      Get.to(HomePage());
    }
  } catch (e) {
    // Gérer les erreurs d'authentification ici
    print('Erreur d\'authentification : $e');
  }
}

Future<void> disconnect() async {
  await _auth.signOut();
  Get.offAll(const SignInView());
}

User? get user => _auth.currentUser;
