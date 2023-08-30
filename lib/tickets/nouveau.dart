import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema/controllers/detailsControllers/nouv_ticket.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ticket_material/ticket_material.dart';
import '../details/qrcode_page.dart';

class BookingPage extends StatelessWidget {
  final BookingController bookingController = BookingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mes Réservations'),
      ),
      body: FutureBuilder<List<DocumentSnapshot>>(
        future: bookingController.getUserBookings(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Attente pendant le chargement
          } else if (snapshot.hasError) {
            return Text('Erreur : ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // return Text('Aucune réservation valide.');
            return Center(
              child: Column(
                children: [
                  const SizedBox(height: 100.0),
                  Container(
                    height: 120.0,
                    width: 120.0,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/tickets.png',
                        ),
                        fit: BoxFit.fill,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    "Vous n'avez pas de tickets expirés !",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                DocumentSnapshot bookingSnapshot = snapshot.data![index];
                Map<String, dynamic> bookingData =
                    bookingSnapshot.data() as Map<String, dynamic>;

                String userId = bookingData['phone'];
                int ticketId = bookingData['idTicket'];
                String movieTitle = bookingData['title'];
                String movieImage = bookingData['image'];
                Timestamp movieDateTimestamp = bookingData['movieDate'];
                DateTime movieDate = movieDateTimestamp
                    .toDate(); // Convertit le Timestamp en DateTime

                String formattedDate = DateFormat('dd MMM yyyy - HH:mm')
                    .format(movieDate); // Formate la date

                return InkWell(
                  onDoubleTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QRCodePage(
                          userId: userId,
                          ticketId: ticketId,
                          qrImage: movieImage,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TicketMaterial(
                      height: 150,
                      colorBackground: Colors.white,
                      leftChild: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(movieTitle),
                          Text('Date : $formattedDate'),
                        ],
                      ),
                      rightChild: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(movieImage),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
