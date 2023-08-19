import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'otp.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneNumberController = TextEditingController();
  String _phoneNumber = '';
  bool isLoading = false;



  Future<void> verifyPhoneNumber() async {
    setState(() {
      isLoading = true;
    });

    String phoneNumber = _phoneNumber;

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {
          // Authentification terminée automatiquement
          // Peut être utilisé pour se connecter directement
        },
        verificationFailed: (FirebaseAuthException e) {
          // Erreur lors de la vérification du numéro de téléphone
          print('Erreur de vérification : ${e.message}');
          setState(() {
            isLoading = false;
          });
        },
        codeSent: (String verificationId, int? resendToken) {
          setState(() {
            isLoading = false;
          });

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OTPPage(
                phoneNumber: phoneNumber,
                verificationId: verificationId,
              ),
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print("Erreur lors de l'envoi du code OTP : $e");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FractionallySizedBox(
            alignment: Alignment.topCenter,
            heightFactor: 0.7,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/images/awe.jpg',
                      ),
                      fit: BoxFit.cover)
                  /*  gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                Colors.blue[900]!,
                Colors.blue[800]!,
                Colors.blue[400]!,
              ])*/
                  ),
            ),
          ),
          /*Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 300,
            child: Center(
              child: Container(
                width: 200,
                height: 200,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/images/VR.png',
                        ),
                        fit: BoxFit.cover)),
              ),
            ),
          ),*/
          FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.5,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Se connecter",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 30,
                                fontFamily: "Times new roman"),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Bienvenue sur E-cinema",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: "Times new roman"),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.white,
                                blurRadius: 20,
                                offset: Offset(0, 10))
                          ]),
                      child: IntlPhoneField(
                        controller: _phoneNumberController,
                        decoration: const InputDecoration(
                          labelText: 'Numéro de téléphone',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        initialCountryCode: 'BF',
                        onChanged: (phone) {
                          print(phone.completeNumber);
                          setState(() {
                            _phoneNumber = phone.completeNumber;
                          });
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: TextButton(
                          child: const Text(
                            "Vous accepterez nos termes et conditions",
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () {
                            _showDropdown(context);
                          }),
                    ),
                    AbsorbPointer(
                      absorbing: isLoading,
                      child: Opacity(
                        opacity: isLoading ? 0.5 : 1.0,
                        child: InkWell(
                          onTap: verifyPhoneNumber,
                          child: Container(
                            height: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue,
                            ),
                            child: isLoading
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : const Center(
                                    child: Text(
                                      "Se connecter",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),

                    /*InkWell(
                      onTap: verifyPhoneNumber,
                      child: Container(
                        height: 50,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue),
                        child: const Center(
                          child: Text(
                            "Se connecter",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),*/
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showDropdown(BuildContext context) {
    //Fonction pour le dropdown des salles de cinéma
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              width: MediaQuery.of(context).size.width,
              height: 320,
              child: const Column(
                children: [
                  Text(
                    "Termes et Conditions.\n",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    "1-E-cinema, votre application mobile pour vous aider dans la recherche de vos salles de cinéma.E-cinema.\n",
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    "2-E-cinema, votre application mobile pour vous aider dans la recherche de vos salles de cinéma.E-cinema.\n",
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    "3-E-cinema, votre application mobile pour vous aider dans la recherche de vos salles de cinéma.E-cinema.\n",
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    "E-cinema V 1.0.0",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.justify,
                  ),
                ],
              )),
        );
      },
    );
  }
}
