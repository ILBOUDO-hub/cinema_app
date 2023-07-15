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
        body: Column(
          children: [
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      // action à exécuter quand cet InkWell est cliqué
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return Olympia();
                      }));
                    },
                    child: const Center(
                      child: Text(
                        'Olympia 2000',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      // action à exécuter quand cet InkWell est cliqué
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return Olympia();
                      }));
                    },
                    child: const Center(
                      child: Text(
                        'Olympia Pissy',
                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      // action à exécuter quand cet InkWell est cliqué
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return Olympia();
                      }));
                    },
                    child: const Center(
                      child: Text(
                        'Ciné Burkina',
                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      // action à exécuter quand cet InkWell est cliqué
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return Olympia();
                      }));
                    },
                    child: const Center(
                      child: Text(
                        'Ciné  Nerwaya',
                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
