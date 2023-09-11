import 'package:cinema/controllers/detailsControllers/ancien.dart';
import 'package:cinema/controllers/userController.dart';
import 'package:cinema/function.dart';
import 'package:cinema/parametres/assistance.dart';
import 'package:cinema/parametres/favoris.dart';
import 'package:cinema/parametres/politique.dart';
import 'package:cinema/parametres/scanner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cinema/models/users.dart';

class Profil extends StatefulWidget {
  @override
  _ProfilSate createState() => new _ProfilSate();
}

class _ProfilSate extends State<Profil> {
  final UserController userController = Get.find<UserController>();
  final ExpiredBookingController expiredController =
      Get.find<ExpiredBookingController>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 2,
          title: const Text(
            "CinePlus",
          ),
          centerTitle: false,
          titleTextStyle: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: "Times new roman"),
          backgroundColor: Colors.blue,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.notifications_none),
              onPressed: () {
                /*Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return Movies();
                  }));*/
              },
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 15),
                Column(
                  children: [
                    const CircleAvatar(
                      radius: 65.0,
                      backgroundImage: AssetImage(
                        'assets/images/perso.jfif',
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    /*   Text(
                       userController.user?.firstname ?? '',
                     // 'Auguste ILBOUDO',
                      // "${(user?.phoneNumber ?? "")}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),*/
                    Obx(() {
                      return Text(
                        userController.user?.firstName ??
                            'Utilisateur non connecté',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }),
                    Obx(() {
                      return Text(
                        userController.user?.phoneNumber ??
                            'Utilisateur non connecté',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }),
                  ],
                ),
                const SizedBox(height: 10),
                // Text("Numéro de téléphone: " + (user?.phoneNumber ?? "")),
                //Text("Uid: " + (user?.uid ?? "")),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0, left: 8.0),
                  child: Card(
                      //Code pour afficher les tickets valides
                      child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            child: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('booking')
                              .where('phone',
                                  isEqualTo: userController.user?.phoneNumber ??
                                      'Utilisateur non connecté')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return const Text(
                                  'Erreur de chargement des commentaires.');
                            }

                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            }

                            final tickets = snapshot.data!.docs;

                            return Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  //  color: Colors.orangeAccent,
                                  child: Text("${tickets.length}",
                                      style: TextStyle(fontSize: 20)),
                                ),
                                const Text(
                                  'Ticket(s)',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            );
                          },
                        )),
                        Column(
                          children: [
                            Container(
                              //Code pour les afficher les anciens tickets
                              padding: EdgeInsets.all(10),
                              child: FutureBuilder<List<DocumentSnapshot>>(
                                future: expiredController.getUserBookings(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return CircularProgressIndicator();
                                  } else if (snapshot.hasError) {
                                    return Text('Erreur : ${snapshot.error}');
                                  } else {
                                    int numberOfParticipations =
                                        snapshot.data?.length ?? 0;
                                    return Text(
                                      '$numberOfParticipations',
                                      style: const TextStyle(fontSize: 20),
                                    );
                                  }
                                },
                              ),
                            ),
                            const Text(
                              'Participation(s)',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            /* Container(
                              padding: EdgeInsets.all(10),
                              // color: Colors.orangeAccent,
                              child: Text("00",         
                           style: TextStyle(fontSize: 20)),
                            ),
                            const Text(
                              'Participation(s)',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),*/
                          ],
                        ),
                      ],
                    ),
                  )),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.account_circle,
                    color: Colors.black,
                  ),
                  title: const Text(
                    'Mon profil',
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                  onTap: () {
                    setState(() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return QRScannerPage();
                      }));
                    });
                  },
                ),
                /*ListTile(
                  leading: const Icon(Icons.dashboard, color: Colors.black),
                  title: const Text('Mes favoris',
                      style: TextStyle(fontSize: 18.0, color: Colors.black)),
                  onTap: () {
                    // Do something
                    setState(() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return Favoris();
                      }));
                    });
                  },
                ),*/
                ListTile(
                  leading: const Icon(Icons.privacy_tip, color: Colors.black),
                  title: const Text('Termes et Conditions',
                      style: TextStyle(fontSize: 18.0, color: Colors.black)),
                  onTap: () {
                    // Do something
                    setState(() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return Privacy();
                      }));
                    });
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.support_agent_sharp,
                      color: Colors.black),
                  title: const Text('Assistance',
                      style: TextStyle(fontSize: 18.0, color: Colors.black)),
                  onTap: () {
                    // Do something
                    setState(() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return Assistance();
                      }));
                    });
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.login_rounded, color: Colors.black),
                  title: const Text('Se déconnecter',
                      style: TextStyle(fontSize: 18.0, color: Colors.black)),
                  onTap: () async {
                    await disconnect();
                  },
                ),
                //  const SizedBox(height: 50,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
