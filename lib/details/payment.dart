import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentDetail extends StatefulWidget {
  final int idMovies,idTicket, price, quantity;

  PaymentDetail({
    required this.idMovies,
    required this.idTicket,
    required this.price,
    required this.quantity,
  });

  @override
  State<PaymentDetail> createState() => _PaymentDetailState();
}

class _PaymentDetailState extends State<PaymentDetail> {
  int montant = 0;
  TextEditingController otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    montant = widget.price * widget.quantity;
  }

  Future<void> makePayment(String ussdCode, String app_id, bool orange) async {
    try {
      EasyLoading.show(
        indicator: Column(
          children: [
            CircularProgressIndicator(),
            Text(
              "Vérification du paiement en cours...",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      );
      var res = await Dio(BaseOptions(
        baseUrl: "https://shark-app-xeyhn.ondigitalocean.app",
      )).post("/pay/control", data: {
        "api_key": "aT8CkVcrs6b1UrA3kc5lx636tVZL3PNv",
        "app_id": app_id,
        "code_otp": ussdCode,
        "amount": montant,
        "orange": orange,
      });

      if ((res.data as Map)['success']) {
        EasyLoading.dismiss();
        print("Paiement réussi");
        // Traitez la réussite du paiement ici
      } else {
        EasyLoading.showError(
            "Code invalide, veuillez vérifier vos informations");
      }
    } catch (e) {
      EasyLoading.showError("Erreur lors de la vérification du paiement");
    }
  }

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
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
        title: const Text(
          "Paiement",
          style: TextStyle(
            fontFamily: 'Varela',
            fontSize: 20.0,
            color: Color(0xFF545D68),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Montant à payer : $montant XOF",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final String ussdCode = "*144*10*05690560*$montant#";
                await launch("tel:${Uri.encodeComponent(ussdCode)}");
              },
              child: Text("Payer avec Orange Money"),
            ),
            SizedBox(height: 20),
            TextField(
              controller: otpController,
              decoration: InputDecoration(
                labelText: 'Code OTP reçu',
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                String enteredOtp = otpController.text;
                await makePayment(
                  enteredOtp,
                  "8b87b378-caf8-4288-9acd-0ad432d466f0",
                  true,
                );
              },
              child: Text("Vérifier le paiement"),
            ),
          ],
        ),
      ),
    );
  }
}
