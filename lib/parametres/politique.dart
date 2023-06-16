import 'package:flutter/material.dart';

class Privacy extends StatefulWidget {
  @override
  _PrivacyState createState() => new _PrivacyState();
}

class _PrivacyState extends State<Privacy> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Termes et Conditions'),
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
        body: const Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "E-cinema, votre application mobile pour vous aider dans la recherche de vos salles de cinéma.E-cinema, votre application mobile pour vous aider dans la recherche de vos salles de cinéma.E-cinema, votre application mobile pour vous aider dans la recherche de vos salles de cinéma.E-cinema, votre application mobile pour vous aider dans la recherche de vos salles de cinéma. \n\nE-cinema, votre application mobile pour vous aider dans la recherche de vos salles de cinéma.E-cinema, votre application mobile pour vous aider dans la recherche de vos salles de cinéma.E-cinema, votre application mobile pour vous aider dans la recherche de vos salles de cinéma.E-cinema, votre application mobile pour vous aider dans la recherche de vos salles de cinéma.E-cinema, votre application mobile pour vous aider dans la recherche de vos salles de cinéma. \n\nE-cinema, votre application mobile pour vous aider dans la recherche de vos salles de cinéma.E-cinema, votre application mobile pour vous aider dans la recherche de vos salles de cinéma.E-cinema, votre application mobile pour vous aider dans la recherche de vos salles de cinéma.E-cinema, votre application mobile pour vous aider dans la recherche de vos salles de cinéma.E-cinema, votre application mobile pour vous aider dans la recherche de vos salles de cinéma.E-cinema, votre application mobile pour vous aider dans la recherche de vos salles de cinéma.\n\nE-cinema, votre application mobile pour vous aider dans la recherche de vos salles de cinéma.E-cinema, votre application mobile pour vous aider dans la recherche de vos salles de cinéma.E-cinema, votre application mobile pour vous aider dans la recherche de vos salles de cinéma.",
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
