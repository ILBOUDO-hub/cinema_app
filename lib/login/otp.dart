import 'package:cinema/login/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../main.dart';

class OTPPage extends StatefulWidget {
  final String phoneNumber;
  final String verificationId;

  const OTPPage({
    super.key,
    required this.phoneNumber,
    required this.verificationId,
  });

  @override
  _OTPPageState createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  final _formKey = GlobalKey<FormState>();
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());
  String _otp = '';

  void _submitOTP() async {
    if (_otp.length == 6) {
      bool userExists = await _checkUserExistence();

      //Si l'utilisateur existe il directement conduit sur la page principale
      if (userExists) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (BuildContext context) {
            return HomePage();
          }),
        );
      } else {
        //Sinon l'on verifie l'OTP et il recree un compte
        _verifyOTP(_otp);
      }
    }
  }

  Future<void> _verifyOTP(String otp) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: otp,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (BuildContext context) {
          return UserPage(phoneNumber: widget.phoneNumber);
        }),
      );
    } catch (e) {
      // Erreur de vérification du code OTP
      print('Erreur de vérification du code OTP : $e');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Erreur de vérification'),
            content: const Text(
                'Une erreur s\'est produite lors de la vérification du code OTP.'),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }
  }

  bool _userExists =
      false; // Variable locale pour mettre en cache les résultats de la requête

  Future<bool> _checkUserExistence() async {
    if (_userExists) {
      // Utiliser les résultats en cache si disponibles
      return true;
    } else {
      String phoneNumber = widget.phoneNumber;
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('phone', isEqualTo: phoneNumber)
          .limit(1)
          .get();

      _userExists =
          snapshot.docs.isNotEmpty; // Mettre à jour la variable en cache

      return _userExists;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: 300,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/images/cine.jpg',
                      ),
                      fit: BoxFit.cover)),
            ),
            const Text(
              'Veuillez entrer le code de vérification',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  6,
                  (index) => SizedBox(
                    width: 50,
                    child: TextFormField(
                      controller: _controllers[index],
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(1),
                      ],
                      style: const TextStyle(fontSize: 24),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onChanged: (value) {
                        if (value.length == 1 && index < 5) {
                          FocusScope.of(context).nextFocus();
                        }
                        setState(() {
                          _otp = _controllers.map((c) => c.text).join();
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitOTP,
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Continuer',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
