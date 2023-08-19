import 'package:cinema/login/preference.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../main.dart';

class OTPVerificationPage extends StatefulWidget {
  final String phoneNumber;
  final String verificationId;

  OTPVerificationPage(
      {required this.phoneNumber, required this.verificationId});

  @override
  _OTPVerificationPageState createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  TextEditingController _otpController = TextEditingController();

  void signInWithPhoneAuthCredential(
      auth.PhoneAuthCredential credential) async {
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      // Authentification réussie
      print('Authentification réussie');
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return MoviePreferences();
      }));
    } catch (e) {
      // Erreur lors de l'authentification
      print('Erreur d\'authentification : ${e.toString()}');
    }
  }

  void verifyOTP() {
    String otp = _otpController.text;
    auth.PhoneAuthCredential credential = auth.PhoneAuthProvider.credential(
      verificationId: widget.verificationId,
      smsCode: otp,
    );

    signInWithPhoneAuthCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vérification OTP'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text('Vérification du numéro de téléphone : ${widget.phoneNumber}'),
            SizedBox(height: 20.0),
            TextField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Code OTP',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: verifyOTP,
              child: Text('Vérifier OTP'),
            ),
          ],
        ),
      ),
    );
  }
}
