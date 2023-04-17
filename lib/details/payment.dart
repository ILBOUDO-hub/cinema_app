import 'package:cinema/details/video_player.dart';
import 'package:flutter/material.dart';

import '../models/Product.dart';

class PaymentDetail extends StatelessWidget {
  final assetPath1,
      assetPath2,
      cookieauteur,
      cookieprice,
      cookiename,
      cookiecategorie;
  //  isFavorite;
  final _controller = PageController();

  PaymentDetail({
    this.assetPath1,
    this.assetPath2,
    this.cookieauteur,
    this.cookieprice,
    this.cookiename,
    this.cookiecategorie,
    //this.isFavorite
  });

  bool isPressed = true;
  bool isPressed2 = true;
  bool isHighlighted = true;
  @override
  Widget build(BuildContext context) {
    String cookieprices = cookieprice.toString();
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
          title: Text("Paiement",
              style: const TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 20.0,
                  color: Color(0xFF545D68))),
          /*actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.favorite_sharp, color: Color(0xFF545D68)),
              onPressed: () {},
            ),
          ],*/
        ),
        body: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Text(
              "Prix à payer: $cookieprice FCFA ",
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 150,
                  child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Image.asset('assets/logos/moovmoney.jfif'),
                  ),
                ),
                Container(
                  height: 150,
                  width: 150,
                  color: Colors.white,
                  child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Image.asset('assets/logos/orange.jpg'),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
