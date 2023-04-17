import 'package:cinema/accueil.dart';
import 'package:cinema/parametres/assistance.dart';
import 'package:cinema/calendrier.dart';
import 'package:cinema/categories/movies.dart';
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
          title: const Text('E-cinema'),
          centerTitle: false,
          titleTextStyle: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          backgroundColor: Colors.blue,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.notifications_none),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Movies();
                }));
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
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
                          fontSize: 14.0,
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
                      
                      Text(
                        'Tickets',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
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
                      Text(
                        'Favoris',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                ],
              ),

              const SizedBox(height: 30),

              ListTile(
                leading: Icon(
                  Icons.account_circle,
                  color: Colors.black,
                ),
                title: Text(
                  'Mon profil',
                  style: TextStyle(color: Colors.black),
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
                leading: Icon(Icons.dashboard, color: Colors.black),
                title:
                    Text('Mes favoris', style: TextStyle(color: Colors.black)),
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
                leading: Icon(Icons.mail, color: Colors.black),
                title:
                    Text('Notification', style: TextStyle(color: Colors.black)),
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
                leading: Icon(Icons.home_work_rounded, color: Colors.black),
                title:
                    Text('Assistance', style: TextStyle(color: Colors.black)),
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
                leading: Icon(Icons.login_rounded, color: Colors.black),
                title: Text('Se déconnecter',
                    style: TextStyle(color: Colors.black)),
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
    );
  }
}
