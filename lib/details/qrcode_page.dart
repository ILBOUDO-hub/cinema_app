import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodePage extends StatelessWidget {
  final String userId;
  final int ticketId;
  final String qrImage;

  QRCodePage({
    required this.userId,
    required this.ticketId,
    required this.qrImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Code QR du Ticket'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              CachedNetworkImage(
                imageUrl: qrImage,
                placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),  fit: BoxFit.cover
              ),
              Container( color: Colors.white,padding: const EdgeInsets.all(10.0),
                child: QrImageView(
                  data: 'UserId: $userId\nTicketId: $ticketId',
                  version: QrVersions.auto,
                  size: 250,
                  gapless: false,
                  embeddedImageStyle: const QrEmbeddedImageStyle(
                    size: Size(80, 80),
                  ),
                ),
              ),
            ],
          ),
         /* SizedBox(height: 20),
          Text('ID de l\'utilisateur : $userId'),
          Text('ID du ticket : $ticketId'),*/
        ],
      ),
    );
  }
}
