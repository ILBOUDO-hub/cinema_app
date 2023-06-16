import 'package:flutter/material.dart';

class Gateau {
  late String name, auteur, imgPath1, imgPath2, categorie, context;
  double price;
  bool added, isFavorite;

  Gateau({
    required this.name,
    required this.auteur,
    required this.categorie,
    required this.price,
    required this.imgPath1,
    required this.imgPath2,
    required this.context,
    required this.added,
    required this.isFavorite,
  });

  Gateau.fromMap(
      Map<String, dynamic> data, this.price, this.added, this.isFavorite) {
    name = data['name'];
    auteur = data['auteur'];
    categorie = data['categorie'];
    price = data['price'];
    imgPath1 = data['imgPath1'];
    context = data['context'];
    added = data['added'];
    isFavorite = data['isFavorite'];
  }
}

List<Gateau> gateau = [
  Gateau(
    name: "Black Adam",
    auteur: "Ciné Burkina",
    categorie: "action",
    isFavorite: false,
    price: 2000,
    added: true,
    context:
        "Lorem Dolor set simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
    imgPath1: "assets/images/adam.jfif",
    imgPath2: 'assets/real.mp4',
  ),
  Gateau(
    name: "Avatar",
    auteur: "Canal olympia",
    categorie: "action",
    isFavorite: false,
    price: 2000,
    added: true,
    context:
        "Lorem Dolor set simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
    imgPath1: "assets/images/avatar.jfif",
    imgPath2: 'assets/real.mp4',
  ),
  Gateau(
    name: "Astérix",
    auteur: "Canal olympia",
    categorie: "action",
    isFavorite: false,
    price: 2000,
    added: true,
    context:
        "Lorem Dolor set simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
    imgPath1: "assets/images/asterix.jfif",
    imgPath2: 'assets/real.mp4',
  ),
  Gateau(
    name: "Aquaman",
    auteur: "Canal olympia",
    categorie: "action",
    isFavorite: false,
    price: 2000,
    added: true,
    context:
        "Lorem Dolor set simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
    imgPath1: "assets/images/aquaman.jfif",
    imgPath2: 'assets/real.mp4',
  ),
  Gateau(
    name: "Demon Slayer",
    auteur: "Canal olympia",
    categorie: "action",
    isFavorite: false,
    price: 2000,
    added: true,
    context:
        "Lorem Dolor set simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
    imgPath1: "assets/images/demon.jfif",
    imgPath2: 'assets/real.mp4',
  ),
  Gateau(
    name: "Age of Ultron",
    auteur: "Ciné Nermaya",
    categorie: "action",
    isFavorite: false,
    price: 2000,
    added: true,
    context:
        "Lorem Dolor set simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
    imgPath1: "assets/images/avengers.jfif",
    imgPath2: 'assets/real.mp4',
  ),
  Gateau(
    name: "Black Panthère",
    auteur: "Canal Olympia",
    categorie: "action",
    isFavorite: false,
    price: 2000,
    added: true,
    context:
        "Lorem Dolor set simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
    imgPath1: "assets/images/panther.jfif",
    imgPath2: 'assets/real.mp4',
  ),
];











/*var gateaux = {
  "Gateau" : [
    {
    'name': "Black Adam",
    'auteur': "Ciné Burkina",
    'categorie': "action",
    'isFavorite': false,
    'price': 2000,
    'added': true,
    'context':
        "Lorem Dolor set simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
    'imgPath1': "assets/images/adam.jfif",
    'imgPath2': "assets/images/ferrari4.jpg",
    }
  ],
   "Gateau1" : [
    {
    'name': "Black Adam",
    'auteur': "Ciné Burkina",
    'categorie': "action",
    'isFavorite': false,
    'price': 2000,
    'added': true,
    'context':
        "Lorem Dolor set simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
    'imgPath1': "assets/images/adam.jfif",
    'imgPath2': "assets/images/ferrari4.jpg",
    }
  ],
   "Gateau3" : [
    {
    'name': "Black Adam",
    'auteur': "Ciné Burkina",
    'categorie': "action",
    'isFavorite': false,
    'price': 2000,
    'added': true,
    'context':
        "Lorem Dolor set simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
    'imgPath1': "assets/images/adam.jfif",
    'imgPath2': "assets/images/ferrari4.jpg",
    }
  ],
  
};*/


class dynamics {
  late String name, auteur, imgPath1, imgPath2, categorie, context;
  double price;
  bool added, isFavorite;

  dynamics({
    required this.name,
    required this.auteur,
    required this.categorie,
    required this.price,
    required this.imgPath1,
    required this.imgPath2,
    required this.context,
    required this.added,
    required this.isFavorite,
  });

  dynamics.fromMap(
      Map<String, dynamic> data, this.price, this.added, this.isFavorite) {
    name = data['name'];
    auteur = data['auteur'];
    categorie = data['categorie'];
    price = data['price'];
    imgPath1 = data['imgPath1'];
    context = data['context'];
    added = data['added'];
    isFavorite = data['isFavorite'];
  }
}


  List<dynamic> _movies = [
    {
      'title': 'Black Widow',
      'image': "assets/images/adam.jfif",
      'description': 'Black Widow'
    },
    {
      'title': 'The Suicide Squad',
      'image': "assets/images/panther.jfif",
      'description': 'The Suicide Squad'
    },
    {
      'title': 'Godzilla Vs Kong',
      'image': "assets/images/asterix.jfif",
      'description': 'Godzilla Vs Kong'
    },
  ];