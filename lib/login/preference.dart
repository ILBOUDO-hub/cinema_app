import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cinema/main.dart';

class MoviePreferences extends StatefulWidget {
  const MoviePreferences({Key? key}) : super(key: key);

  @override
  _MoviePreferencesState createState() => _MoviePreferencesState();
}

class _MoviePreferencesState extends State<MoviePreferences> {
  final List<String> _categories = [
    'Recommandé',
    'Africain',
    'Action',
    'Comedie',
    'Romance',
    'Animation',
    'Drama',
    'Science-Fiction',
    'Horreur',
  ];
  List<String> _selectedCategories = [];

  void _savePreferences() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    List<String> preferences = _selectedCategories;

    await FirebaseFirestore.instance.collection('users').doc(uid).update({
      'preferences': preferences,
    });

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (BuildContext context) {
        return HomePage();
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Préférences'),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
            child: Text(
              'Sélectionner vos préférences :',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Wrap(
              spacing: 18.0,
              runSpacing: 8.0,
              children: List<Widget>.generate(_categories.length, (int index) {
                return FilterChip(
                  label: Text(_categories[index]),
                  selected: _selectedCategories.contains(_categories[index]),
                  onSelected: (bool selected) {
                    setState(() {
                      if (selected) {
                        _selectedCategories.add(_categories[index]);
                      } else {
                        _selectedCategories.remove(_categories[index]);
                      }
                    });
                  },
                  selectedColor: Colors.blue,
                  checkmarkColor: Colors.white,
                  backgroundColor: Colors.grey.shade300,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(right: 10, left: 140, top: 10, bottom: 10),
        padding: const EdgeInsets.only(right: 10, left: 40, top: 10, bottom: 10),
        height: 70,
        width: 40,
        child: FloatingActionButton.extended(
          heroTag: 'btn1',
          extendedPadding: const EdgeInsets.all(33.0),
          label: const Text(
            'Valider',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blue,
          onPressed: _savePreferences,
        ),
      ),
    );
  }
}
