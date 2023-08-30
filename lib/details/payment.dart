import 'package:cinema/controllers/userController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/moviesTest.dart';
import 'qrcode_page.dart';

class PaymentDetail extends StatefulWidget {
  final int idMovies, idTicket, price, quantity;
  final tickets;
  final String movieName, movieImage;
  final movieDate;

  PaymentDetail({
    required this.movieDate,
    required this.movieImage,
    required this.idMovies,
    required this.idTicket,
    required this.price,
    required this.quantity,
    required this.tickets,
    required this.movieName,
  });

  @override
  State<PaymentDetail> createState() => _PaymentDetailState();
}

class _PaymentDetailState extends State<PaymentDetail> {
  final UserController userController = Get.find<UserController>();
  int montant = 0;
  TextEditingController otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    montant = widget.price * widget.quantity;
  }

  // Supposons que vous ayez une méthode pour afficher la page QRCodePage
  /*void _showQRCodePage(BuildContext context, String userId, int ticketId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QRCodePage(userId: userId, ticketId: ticketId),
      ),
    );
  }*/

  Future<void> makePayment(String ussdCode, String app_id, bool orange) async {
    try {
      EasyLoading.show(
        indicator: const Column(
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
        final CollectionReference bookingsRef =
            FirebaseFirestore.instance.collection('booking');

        int idTicket = widget.idTicket;
        String image = widget.movieImage, title = widget.movieName;
        DateTime movieDate = widget.movieDate;
        String phoneNumber =
            userController.user?.phoneNumber ?? 'Utilisateur non connecté';

        bookingsRef.add({
          'idTicket': idTicket,
          'phone': phoneNumber,
          'image': image,
          'title': title,
          'movieDate': movieDate,
          // Autres champs de la réservation si nécessaire
        }).then((DocumentReference document) {
          print('Document ajouté avec l\'ID : ${document.id}');
        }).catchError((error) {
          print('Erreur lors de l\'ajout du document : $error');
        });
       /* _showQRCodePage(
            context,
            userController.user?.phoneNumber ?? 'Utilisateur non connecté',
            widget.idTicket);*/
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
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                " Vous payer pour le ticket du film: ${widget.movieName}",
                style: TextStyle(fontSize: 18),
              ),
              Text(
                "Montant à payer : $montant XOF",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.lightBlue,
                ),
                child: InkWell(
                  onTap: () async {
                    final String ussdCode = "*144*10*05690560*$montant#";
                    await launch("tel:${Uri.encodeComponent(ussdCode)}");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: const DecorationImage(
                                  image: AssetImage(
                                    'assets/logos/orange.png',
                                  ),
                                  fit: BoxFit.contain)),
                        ),
                      ),
                      const Text(
                        "Payer avec Orange Money",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.lightBlue,
                ),
                child: InkWell(
                  onTap: () async {
                    final String ussdCode = "*144*10*05690560*$montant#";
                    await launch("tel:${Uri.encodeComponent(ussdCode)}");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: const DecorationImage(
                                  image: AssetImage(
                                    'assets/logos/moovmoney.jfif',
                                  ),
                                  fit: BoxFit.contain)),
                        ),
                      ),
                      const Text(
                        "Payer avec Moov Money",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: otpController,
                decoration: const InputDecoration(
                  labelText: 'Code OTP reçu',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    String enteredOtp = otpController.text;
                    await makePayment(
                      enteredOtp,
                      "8b87b378-caf8-4288-9acd-0ad432d466f0",
                      true,
                    );
                  },
                  child: const Text(
                    "Effectuer le paiement",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
