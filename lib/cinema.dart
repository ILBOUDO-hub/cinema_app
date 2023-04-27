import 'package:cinema/salles/olympia.dart';
import 'package:flutter/material.dart';

class Cinema extends StatefulWidget {
  @override
  _CinemaState createState() => new _CinemaState();
}

class _CinemaState extends State<Cinema> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Nos salles'),
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
          body: SingleChildScrollView(
              //padding: const EdgeInsets.all(10.0),
              child: Column(
              //  mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
               SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                                            Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return Olympia();
                  }));
                        },
                        child: Container(
                          width: 180,
                          child: AspectRatio(
                            aspectRatio: 1 / 1,
                            child: Image.asset('assets/images/canal.png'),
                          ),
                        ),
                      ),
                      Text("Olympia 2000", style: TextStyle(fontSize: 17),)
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 180,
                          child: AspectRatio(
                            aspectRatio: 1 / 1,
                            child: Image.asset('assets/images/canal.png'),
                          ),
                        ),
                      ),
                      Text("Olympia Pissy", style: TextStyle(fontSize: 17),)
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 180,
                          child: AspectRatio(
                            aspectRatio: 1 / 1,
                            child: Image.asset('assets/images/canal.png'),
                          ),
                        ),
                      ),
                      Text("Ciné Burkina", style: TextStyle(fontSize: 17),)
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 180,
                          child: AspectRatio(
                            aspectRatio: 1 / 1,
                            child: Image.asset('assets/images/nerwaya.JPG'),
                          ),
                        ),
                      ),
                      Text("Ciné Nerwaya", style: TextStyle(fontSize: 17),)
                    ],
                  ),
                ],
              ),
            ],
          ))),
    );
  }
}
