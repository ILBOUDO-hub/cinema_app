import 'package:cinema/controllers/moviesController.dart';
import 'package:cinema/details/ticket_detail.dart';
import 'package:cinema/models/movies.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PaymentDetail extends StatefulWidget {
  final Movie movie;
  int quantity;

  PaymentDetail({required this.movie, this.quantity = 1});

  @override
  State<PaymentDetail> createState() => _PaymentDetailState();
}

class _PaymentDetailState extends State<PaymentDetail> {
  //double montant = this.movie.price;
  //var montant = widget.movie.price * widget.quantity;
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
              widget.movie.title,
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.start,
            ),
            //double montant =  {widget.movie.price} * 3,
            Text(
              //{widget.movie.price} * {widget.quantity} as double,
              " ${widget.movie.price}*${widget.quantity} ",
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
