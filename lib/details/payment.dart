import 'package:cinema/details/sucess_paid.dart';
import 'package:cinema/models/movies.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class PaymentDetail extends StatefulWidget {
  final idMovies, price, quantity;

  PaymentDetail({
    required this.idMovies,
    required this.price,
    required this.quantity,
  });

  @override
  State<PaymentDetail> createState() => _PaymentDetailState();
}

class _PaymentDetailState extends State<PaymentDetail> {
  int montant = 0;

  @override
  void initState() {
    super.initState();
    montant = widget.price * widget.quantity;
  }

  Future<void> makePayment(String phoneNumber, String otp) async {
    final String apiUrl =
        'https://shark-app-xeyhn.ondigitalocean.app/pay/control';

    Map<String, dynamic> requestBody = {
      "api_key": "aT8CkVcrs6b1UrA3kc5lx636tVZL3PNv",
      "app_id": "8b87b378-caf8-4288-9acd-0ad432d466f0",
      "code_otp": otp,
      "amount": montant,
      "orange": true,
    };

    try {
      final response = await http.post(Uri.parse(apiUrl), body: requestBody);

      if (response.statusCode == 200) {
        // La requête a réussi, vous pouvez traiter la réponse ici.
        print("Réponse : ${response.body}");
        print("Paiement reussi");
        // Composer et lancer le code USSD
        final String ussdCode = "*144*10*05690560*$montant#";
        if (await canLaunch("tel:$ussdCode")) {
          await launch("tel:$ussdCode");
        } else {
          print("Impossible de lancer le code USSD");
        }
      } else {
        // La requête a échoué, traitez l'erreur ici.
        print("Erreur : ${response.statusCode}");
      }
    } catch (e) {
      // Une erreur s'est produite lors de la requête.
      print("Erreur : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFF545D68)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text("Paiement",
              style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 20.0,
                  color: Color(0xFF545D68))),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            /* Text(
              widget.movie.title,
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.start,
            ),*/
            SizedBox(
              height: 15,
            ),
            Text(
              montant.toString(),
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        String phoneNumber = "";
                        String otp = "";

                        return AlertDialog(
                          title: const Text('Paiement Moov Money'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              //  Text("*144*10*05690560*${montant}#"),
                              TextButton(
                                onPressed: () async {
                                  String ussdCode =
                                      "*144*10*05690560*$montant#";
                                  String url =
                                      'tel:${Uri.encodeComponent(ussdCode)}';

                                  // Lancer le code USSD directement
                                  await launch(url);
                                },
                                child: Text("*144*10*05690560*$montant#"),
                              ),
                              TextField(
                                decoration: const InputDecoration(
                                    labelText: 'Numéro de téléphone'),
                                onChanged: (value) {
                                  phoneNumber = value;
                                },
                              ),
                              const SizedBox(height: 10),
                              TextField(
                                decoration: const InputDecoration(
                                    labelText: 'Code OTP'),
                                onChanged: (value) {
                                  otp = value;
                                },
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () async {
                                // Envoyez la requête de paiement à l'API
                                await makePayment(phoneNumber, otp);
                                Navigator.of(context).pop();
                              },
                              child: const Text('Valider'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    width: 150,
                    child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: Image.asset('assets/logos/moovmoney.jfif'),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        String phoneNumber = "";
                        String otp = "";

                        return AlertDialog(
                          title: const Text('Paiement Orange Money'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              //  Text("*144*10*05690560*${montant}#"),
                              TextButton(
                                onPressed: () async {
                                  String ussdCode =
                                      "*144*10*05690560*$montant#";
                                  String url =
                                      'tel:${Uri.encodeComponent(ussdCode)}';

                                  // Lancer le code USSD directement
                                  await launch(url);
                                },
                                child: Text("*144*10*05690560*$montant#"),
                              ),
                              TextField(
                                decoration: const InputDecoration(
                                    labelText: 'Numéro de téléphone'),
                                onChanged: (value) {
                                  phoneNumber = value;
                                },
                              ),
                              const SizedBox(height: 10),
                              TextField(
                                decoration: const InputDecoration(
                                    labelText: 'Code OTP'),
                                onChanged: (value) {
                                  otp = value;
                                },
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () async {
                                // Envoyez la requête de paiement à l'API
                                await makePayment(phoneNumber, otp);
                                Navigator.of(context).pop();
                              },
                              child: const Text('Valider'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 150,
                    width: 150,
                    color: Colors.white,
                    child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: Image.asset('assets/logos/orange.jpg'),
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
