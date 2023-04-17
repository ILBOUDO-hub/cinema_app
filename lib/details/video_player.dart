import 'package:flutter/material.dart';

class PlayerDetail extends StatelessWidget {
  final assetPath1,
      assetPath2,
      cookieauteur,
      cookieprice,
      cookiename,
      cookiecategorie;
  //  isFavorite;
  final _controller = PageController();

  PlayerDetail({
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
        title: Text("Trailler",
            style: const TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                color: Color(0xFF545D68))),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.favorite_sharp, color: Color(0xFF545D68)),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(children: [
        const SizedBox(height: 10.0),


        Container(
          color: Colors.amber,
          height: 300,
          width: 150,
          child: Image.asset(assetPath1, fit: BoxFit.cover),
        ),

        SizedBox(
          height: 20,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Text(
                  "$cookiename",
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontFamily: 'Varela',
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Color.fromARGB(255, 83, 83, 83)),
                )),
          ],
        ),

        SizedBox(
          height: 20,
        ),

        Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                height: 50,
                //width: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                //color: Colors.blue,
                child: Center(
                  child: Text(
                  //  "Action",
                    "$cookiecategorie",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                height: 50,
                //   width: 50,

                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.30),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [Icon(Icons.access_alarm_sharp), Text("20:30")],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                height: 50,
                // width: 50,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.30),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(Icons.calendar_month_sharp),
                    Text("07/04/2029")
                  ],
                ),
              )
            ],
          ),
        ),

    

        const SizedBox(height: 10.0),

        Container(
          padding: const EdgeInsets.only(right: 20, left: 20),
          width: MediaQuery.of(context).size.width - 50.0,
          child: const Text("Synopsis",
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ),

        Container(
          padding: const EdgeInsets.all(20.0),
          width: MediaQuery.of(context).size.width - 50.0,
          child: const Text(
              'Cold, creamy ice cream sandwiched between delicious deluxe cookies. Pick your favorite deluxe cookies and ice cream flavor. Cold, creamy ice cream sandwiched between delicious deluxe cookies. Pick your favorite deluxe cookies and ice cream flavor.',
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontFamily: 'Varela', fontSize: 16.0, color: Colors.black)),
        ),
        //  color: Color(0xFFB4B8B9)
        //  const SizedBox(height: 10.0),
      ]),

    );
  }
}
