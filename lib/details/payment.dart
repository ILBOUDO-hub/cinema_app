import 'package:flutter/material.dart';

class PaymentDetail extends StatelessWidget {
  final imagePath,
      assetPath2,
      author,
      price,
      title,
      description,
      urlvideo,
      categorie;
  //  isFavorite;
  final _controller = PageController();

  PaymentDetail(
      {super.key, this.imagePath,
      this.assetPath2,
      this.author,
      this.price,
      this.title,
      this.description,
      this.urlvideo,
      this.categorie
      //this.isFavorite
      });

  bool isPressed = true;
  bool isPressed2 = true;
  bool isHighlighted = true;
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
              author,
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
