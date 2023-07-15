import 'package:cinema/accueil.dart';
import 'package:cinema/parametres/assistance.dart';
import 'package:cinema/parametres/favoris.dart';
import 'package:cinema/parametres/politique.dart';
import 'package:flutter/material.dart';

class Profil extends StatefulWidget {
  @override
  _ProfilSate createState() => new _ProfilSate();
}

class _ProfilSate extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            elevation: 2,
            title: const Text("CinePlus",),
            centerTitle: false,
            titleTextStyle: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
                          fontFamily: "Times new roman"
            ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Column(
                      children: [
                        CircleAvatar(
                          radius: 65.0,
                          backgroundImage: AssetImage(
                            'assets/images/perso.jfif',
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          'Auguste ILBOUDO',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          color: Colors.lightBlueAccent,
                          child: Text("02", style: TextStyle(fontSize: 40)),
                        ),
                        const Text(
                          'Tickets',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          color: Colors.orangeAccent,
                          child: Text("00", style: TextStyle(fontSize: 40)),
                        ),
                        const Text(
                          'Favoris',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                /*const Column(
                  children: [
                    CircleAvatar(
                      radius: 65.0,
                      backgroundImage: AssetImage(
                        'assets/images/perso.jfif',
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Auguste ILBOUDO',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          color: Colors.lightBlueAccent,
                          child: const Text("00", style: TextStyle(fontSize: 40)),
                        ),
                        Container(padding: const EdgeInsets.only(top: 25, right: 10.0),
                          height: 67,
                          color: Colors.lightBlueAccent,
                          child: const Text(
                            'Tickets',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          color: Colors.orangeAccent,
                          child: const Text("00", style: TextStyle(fontSize: 40)),
                        ),
                        Container(padding: const EdgeInsets.only(top: 25, right: 10.0),
                          height: 67,
                          color: Colors.orangeAccent,
                          child: const Text(
                            'Favoris',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),*/

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
                    // Do something
                    setState(() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return Accueil();
                      }));
                    });
                  },
                ),
                ListTile(
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
                ),
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
                  onTap: () {
                    // Do something
                    setState(() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return Accueil();
                      }));
                    });
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
