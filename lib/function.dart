import 'package:cinema/home.dart';
import 'package:cinema/sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main.dart';

//72374141
//69714785
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

/*Future<void> validateOtp(String smsCode, String verificationId) async {
  final _credential = PhoneAuthProvider.credential(
      verificationId: verificationId, smsCode: smsCode);
  await _auth.signInWithCredential(_credential);
  return;
}*/
Future<void> validateOtp(String smsCode, String verificationId, String phoneNumber) async {
  final _credential = PhoneAuthProvider.credential(
      verificationId: verificationId, smsCode: smsCode);

  // Attendre que l'utilisateur soit connecté avec le code OTP
  try {
    await _auth.signInWithCredential(_credential);

    // Utilisez l'objet authStateChanges pour écouter les changements d'état de l'utilisateur
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user != null) {
        // L'utilisateur existe déjà, redirigeons-le vers la page HomePage
        Get.to(HomePage());
      } else {
        // L'utilisateur n'existe pas encore, enregistrons-le dans la collection "users"
        // Créez une référence à la collection 'users' dans Firebase Firestore
        final usersRef = FirebaseFirestore.instance.collection('users');

        // Utilisez la méthode "add" pour ajouter les données et générer automatiquement un ID
        await usersRef.add({
          'phone': phoneNumber,
          // Ajoutez d'autres champs nécessaires pour les autres informations de l'utilisateur
          // ...
        });

        // Après avoir enregistré l'utilisateur, redirigeons-le vers la page HomePage
        Get.to(HomePage());
      }
    });
  } catch (e) {
    // Gérer les erreurs d'authentification ici
    print('Erreur d\'authentification : $e');
  }
}


Future<void> disconnect() async {
  await _auth.signOut();
  Get.offAll(const SignInView());
  //return;
}

User? get user => _auth.currentUser;
