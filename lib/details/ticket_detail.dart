import 'package:cinema/details/payment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ticket_material/ticket_material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';

class TicketDetail extends StatefulWidget {
  final imagePath,
      assetPath2,
      author,
      price,
      title,
      description,
      urlvideo,
      categorie;

  TicketDetail(
      {this.imagePath,
      this.assetPath2,
      this.author,
      this.price,
      this.title,
      this.description,
      this.urlvideo,
      this.categorie
      //this.isFavorite
      });

  @override
  State<TicketDetail> createState() => _TicketDetailState();
}

class _TicketDetailState extends State<TicketDetail> {
  DateTime _selectedDate = DateTime.now();
  List<Container> movieOscar = [];

  Widget _buildLeft() {
    return Center(
      child: Text(widget.title),
    );
  }

  Widget _buildRight() {
    return Container(
      // height: 100,
      width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: AssetImage(widget.imagePath), fit: BoxFit.cover)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: const Color(0xFFFCFAF8),
          appBar: AppBar(
            title: const Text('Mes tickets'),
            centerTitle: true,
            titleTextStyle: const TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
            backgroundColor: Colors.blue,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () => Navigator.maybePop(context),
            ),
          ),
          body: Stack(children: [
            ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 70.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 7,
                      itemBuilder: (BuildContext context, int index) {
                        DateTime date =
                            DateTime.now().add(Duration(days: index));
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedDate = date;
                            });
                          },
                          child: Container(
                            width: 70.0,
                            margin: const EdgeInsets.only(right: 10.0),
                            decoration: BoxDecoration(
                              color: _selectedDate.day == date.day
                                  ? Colors.blue
                                  : Color.fromARGB(255, 220, 219, 219),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${date.day}',
                                  style: const TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5.0),
                                Text(
                                  '${_getWeekday(date.weekday)}',
                                  style: const TextStyle(fontSize: 16.0),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: TicketMaterial(
                            height: 140,
                            colorBackground: Colors.blue,
                            radiusBorder: 12,
                            leftChild: _buildLeft(),
                            rightChild: _buildRight(),
                            tapHandler: () {
                              print('ON TAP');
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => PaymentDetail(
                                        imagePath: widget.imagePath,
                                        price: widget.price,
                                        title: widget.title,
                                        author: widget.author,
                                        description: widget.description,
                                        urlvideo: widget.urlvideo,
                                      )));
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: TicketMaterial(
                            height: 140,
                            colorBackground: Colors.blue,
                            radiusBorder: 12,
                            leftChild: _buildLeft(),
                            rightChild: _buildRight(),
                            tapHandler: () {
                              print('ON TAP');
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => PaymentDetail(
                                        imagePath: widget.imagePath,
                                        price: widget.price,
                                        title: widget.title,
                                        author: widget.author,
                                        description: widget.description,
                                        urlvideo: widget.urlvideo,
                                        //isFavorite: gleinfo.isFavorite,
                                      )));
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ]),

                    bottomNavigationBar: Container(
            padding: EdgeInsets.zero,
            width: Get.width,
            height: Get.height * 0.1,
            decoration: const BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(offset: Offset(0, 0), blurRadius: 10, spreadRadius: 0)
            ]),
            child: Center(
                child: Column(
              children: [
                Text(
                  'Nombre de tickets',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    height: MediaQuery.of(context).size.height * 0.06,
                    padding: EdgeInsets.only(left: 8, right: 8),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15)),
                    child:  SpinBox(
                    
                          iconSize: 25,
                          textStyle: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              disabledBorder: InputBorder.none),
                          min: 1,
                          max: 300,
                          value: 1,
                          onChanged: (value) {
                            print(value);
                           // qte.value = value.toInt();
                          }),
                    ),
              ],
            )),
          ),
          ),
    );
  }

  // Récupérer le jour de la semaine à partir de l'indice
  String _getWeekday(int weekday) {
    switch (weekday) {
      case 1:
        return 'Lun';
      case 2:
        return 'Mar';
      case 3:
        return 'Mer';
      case 4:
        return 'Jeu';
      case 5:
        return 'Ven';
      case 6:
        return 'Sam';
      case 7:
        return 'Dim';
      default:
        return "Invalid day";
    }
  }
}
