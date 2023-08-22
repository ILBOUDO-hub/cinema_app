import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class Paid extends StatefulWidget {
  // final Movie movie;
  //int quantity;

  //Paid({required this.movie, this.quantity = 1});

  @override
  State<Paid> createState() => _PaidState();
}

class _PaidState extends State<Paid> {
  int montant = 0;

  @override
  void initState() {
    super.initState();
//    montant = widget.movie.price * widget.quantity;
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
        Text("Paiement recu !")
        ],
      ),
    );
  }
}
