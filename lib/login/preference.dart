import 'package:cinema/main.dart';
import 'package:flutter/material.dart';

class MoviePreferences extends StatefulWidget {
  const MoviePreferences({Key? key}) : super(key: key);

  @override
  _MoviePreferencesState createState() => _MoviePreferencesState();
}

class _MoviePreferencesState extends State<MoviePreferences> {
  final List<String> _categories = [
    'Action',
    'Comédie',
    'Drama',
    'Horreur',
    'Science-Fiction',
    'Anime',
    'Aventure',
    'Amour'
  ];
  List<String> _selectedCategories = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preferences films'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'Sélectionner vos préferences:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 30,),
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
          const SizedBox(height: 20.0),
          /*Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Do something with the selected categories
                                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return HomePage();
                }));
              },
              child: Text('Save Preferences'),
            ),
          ),*/

          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return HomePage();
                }));
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Valider',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
