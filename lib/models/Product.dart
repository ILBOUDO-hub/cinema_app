import 'package:flutter/material.dart';

class Producto {
  final String image, title, description;
  final int price, size, id;
  final Color color;
  Producto({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.size,
    required this.color,
  });
}

List<Producto> producte = [
  Producto(
      id: 1,
      title: "Office Code",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/bag_1.png",
      color: Color(0xFF3D82AE)),
  Producto(
      id: 2,
      title: "Belt Bag",
      price: 234,
      size: 8,
      description: dummyText,
      image: "assets/images/bag_2.png",
      color: Color(0xFFD3A984)),
  Producto(
      id: 3,
      title: "Hang Top",
      price: 234,
      size: 10,
      description: dummyText,
      image: "assets/images/bag_3.png",
      color: Color(0xFF989493)),
  Producto(
      id: 4,
      title: "Old Fashion",
      price: 234,
      size: 11,
      description: dummyText,
      image: "assets/images/bag_4.png",
      color: Color(0xFFE6B398)),
  Producto(
      id: 5,
      title: "Office Code",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/bag_5.png",
      color: Color(0xFFFB7883)),
  Producto(
    id: 6,
    title: "Office Code",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/images/bag_6.png",
    color: Color(0xFFAEAEAE),
  ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";

class Product {
  final String name, vendeur, categorie, description, photo;
  final int price, size;
  Product({
    required this.name,
    required this.vendeur,
    required this.price,
    required this.size,
    required this.categorie,
    required this.description,
    required this.photo,
  });
}

List<Product> products = [
  Product(
    name: "Gucci",
    vendeur: "Auguste",
    price: 4,
    size: 12,
    categorie: "mode",
    description:
        "Lorem Dolor set simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
    photo: "assets/images/bag_1.png",
  ),
  Product(
    name: "Hermes",
    vendeur: "Auguste",
    price: 19,
    size: 12,
    categorie: "mode",
    description: dummyText,
    photo: "assets/images/bag_2.png",
  ),
  Product(
    name: "Dolce Gabana",
    vendeur: "Auguste",
    price: 205,
    size: 12,
    categorie: "mode",
    description: dummyText,
    photo: "assets/images/bag_3.png",
  ),
  Product(
    name: "Christian Dior",
    vendeur: "Auguste ILBOUDO",
    price: 500,
    size: 2,
    categorie: "mode",
    description: dummyText,
    photo: "assets/images/bag_4.png",
  ),
  Product(
    name: "Rose",
    vendeur: "Auguste",
    price: 234,
    size: 12,
    categorie: "mode",
    description: dummyText,
    photo: "assets/images/bag_5.png",
  ),
  Product(
    name: "Noire",
    vendeur: "Auguste ILBOUDO",
    price: 234,
    size: 12,
    categorie: "mode",
    description: dummyText,
    photo: "assets/images/bag_6.png",
  ),
  Product(
    name: "Manette",
    vendeur: "Auguste",
    price: 250,
    size: 12,
    categorie: "sac",
    description: dummyText,
    photo: "assets/categories/pc_1.png",
  ),
  Product(
    name: "PS4",
    vendeur: "Auguste",
    price: 103,
    size: 12,
    categorie: "sac",
    description: dummyText,
    photo: "assets/categories/pc_5.png",
  ),
  Product(
    name: "Audi",
    vendeur: "Auguste ILBOUDO",
    price: 103,
    size: 12,
    categorie: "voiture",
    description: dummyText,
    photo: "assets/categories/1.jpg",
  ),
  Product(
    name: "BMW",
    vendeur: "Auguste",
    price: 103,
    size: 12,
    categorie: "voiture",
    description: dummyText,
    photo: "assets/categories/2.jpg",
  ),
  Product(
    name: "Audi",
    vendeur: "Auguste",
    price: 103,
    size: 12,
    categorie: "voiture",
    description: dummyText,
    photo: "assets/categories/3.jpg",
  ),
  Product(
    name: "PS4-blanc",
    vendeur: "Auguste",
    price: 103,
    size: 12,
    categorie: "appareil",
    description: dummyText,
    photo: "assets/categories/pc_5.png",
  ),
  Product(
    name: "PS4-Profile",
    vendeur: "Auguste ILBOUDO",
    price: 103,
    size: 12,
    categorie: "appareil",
    description: dummyText,
    photo: "assets/categories/pc_3.png",
  ),
  Product(
    name: "PS4-Violet",
    vendeur: "Auguste",
    price: 103,
    size: 12,
    categorie: "appareil",
    description: dummyText,
    photo: "assets/categories/pc_1.png",
  ),
];

class Gateau {
  late String name, auteur, imgPath1,imgPath2, categorie, context;
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

  Gateau.fromMap(Map<String, dynamic> data, this.price, this.added, this.isFavorite) {
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
    imgPath2: "assets/images/ferrari4.jpg",
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
    imgPath2: "assets/images/ferrari4.jpg",
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
    imgPath2: "assets/images/ferrari4.jpg",
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
    imgPath2: "assets/images/ferrari4.jpg",
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
    imgPath2: "assets/images/ferrari4.jpg",
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
    imgPath2: "assets/images/ferrari4.jpg",
  ),









  Gateau(
    name: "Cookie mint",
    auteur: "Auguste",
    categorie: "mode",
    isFavorite: false,
    price: 399,
    added: true,
    context:
        "Lorem Dolor set simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
    imgPath1: "assets/cookiemint.jpg",
    imgPath2: "assets/cookiemint.jpg",
  ),
  Gateau(
    name: "Cookie cream",
    auteur: "Auguste I",
    categorie: "mode",
    isFavorite: true,
    price: 599,
    added: true,
    context:
        "Lorem Dolor set simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
    imgPath1: "assets/cookiecream.jpg",
    imgPath2: "assets/cookiecream.jpg",
  ),
  Gateau(
    name: "Cookie classic",
    auteur: "Auguste",
    categorie: "mode",
    isFavorite: true,
    price: 199,
    added: true,
    context:
        "Lorem Dolor set simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
    imgPath1: "assets/cookieclassic.jpg",
    imgPath2: "assets/cookieclassic.jpg",
  ),
  Gateau(
    name: "Cookie choco",
    auteur: "Brice",
    categorie: "mode",
    isFavorite: false,
    price: 299,
    added: true,
    context:
        "Lorem Dolor set simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
    imgPath1: "assets/cookiechoco.jpg",
    imgPath2: "assets/cookiechoco.jpg",
  ),
  Gateau(
    name: "Manette",
    auteur: "Lebian",
    categorie: "appareil",
    isFavorite: true,
    price: 29000,
    added: true,
    context:
        "Lorem Dolor set simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
    imgPath1: "assets/categories/pc_5.png",
    imgPath2: "assets/categories/pc_4.png",
  ),
  Gateau(
    name: "PS4",
    auteur: "Eleazar",
    categorie: "appareil",
    isFavorite: false,
    price: 50000,
    added: true,
    context:
        "Lorem Dolor set simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
    imgPath1: "assets/categories/pc_1.png",
    imgPath2: "assets/categories/pc_3.png",
  ),
  Gateau(
    name: "PS4",
    auteur: "Eleazar",
    categorie: "appareil",
    isFavorite: false,
    price: 34000,
    added: true,
    context:
        "Lorem Dolor set simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
    imgPath1: "assets/categories/pc_7.png",
    imgPath2: "assets/categories/pc_3.png",
  ),
  Gateau(
    name: "Manette",
    auteur: "Eleazar",
    categorie: "appareil",
    isFavorite: false,
    price: 32000,
    added: true,
    context:
        "Lorem Dolor set simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
    imgPath1: "assets/categories/pc_3.png",
    imgPath2: "assets/categories/pc_7.png",
  ),
  Gateau(
    name: "PS4-Profile",
    auteur: "Eleazar",
    categorie: "appareil",
    isFavorite: true,
    price: 29000,
    added: true,
    context:
        "Lorem Dolor set simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
    imgPath1: "assets/categories/pc_4.png",
    imgPath2: "assets/categories/pc_5.png",
  ),
  Gateau(
    name: "Dolce Gabana",
    auteur: "Eleazar",
    categorie: "accessoire",
    isFavorite: false,
    price: 34000,
    added: true,
    context:
        "Lorem Dolor set simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
    imgPath1: "assets/categories/bag_2.png",
    imgPath2: "assets/categories/bag_1.png",
  ),
  Gateau(
    name: "Christian Dior",
    auteur: "Brice",
    categorie: "accessoire",
    isFavorite: true,
    price: 15000,
    added: true,
    context:
        "Lorem Dolor set simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
    imgPath1: "assets/categories/bag_5.png",
    imgPath2: "assets/categories/bag_5.png",
  ),
  Gateau(
    name: "Sac à main",
    auteur: "Brice",
    categorie: "accessoire",
    isFavorite: true,
    price: 59000,
    added: true,
    context:
        "Lorem Dolor set simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
    imgPath1: "assets/categories/bag_6.png",
    imgPath2: "assets/categories/bag_6.png",
  ),
  Gateau(
    name: "Avatar",
    auteur: "Roch",
    categorie: "voiture",
    isFavorite: false,
    price: 2000,
    added: true,
    context:
        "Lorem Dolor set simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
    imgPath1: "assets/images/avatar.jfif",
    imgPath2: "assets/images/ferrari4.jpg",
  ),

    Gateau(
    name: "Black Adam",
    auteur: "Roch",
    categorie: "voiture",
    isFavorite: false,
    price: 2000,
    added: true,
    context:
        "Lorem Dolor set simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
    imgPath1: "assets/images/adam.jfif",
    imgPath2: "assets/images/ferrari4.jpg",
  ),
    Gateau(
    name: "Audi A8",
    auteur: "Roch",
    categorie: "voiture",
    isFavorite: false,
    price: 2999000,
    added: true,
    context:
        "Lorem Dolor set simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
    imgPath1: "assets/images/ferrari4.jpg",
    imgPath2: "assets/images/ferrari4.jpg",
  ),
  Gateau(
    name: "Lamborghini",
    auteur: "Waly",
    categorie: "voiture",
    isFavorite: true,
    price: 3000000,
    added: true,
    context:
        "Lorem Dolor set simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
    imgPath1: "assets/images/ford4.jpg",
    imgPath2: "assets/images/ford4.jpg",
  ),
  Gateau(
    name: "FORD",
    auteur: "Waly",
    categorie: "voiture",
    isFavorite: true,
    price: 1850000,
    added: true,
    context:
        "Lorem Dolor set simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
    imgPath1: "assets/categories/7.jpg",
    imgPath2: "assets/categories/7.jpg",
  ),
  Gateau(
    name: "BMW",
    auteur: "Waly",
    categorie: "voiture",
    isFavorite: true,
    price: 2900000,
    added: true,
    context:
        "Lorem Dolor set simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
    imgPath1: "assets/categories/8.jpg",
    imgPath2: "assets/categories/8.jpg",
  ),
  Gateau(
    name: "BMW",
    auteur: "Waly",
    categorie: "voiture",
    isFavorite: false,
    price: 1500000,
    added: true,
    context:
        "Lorem Dolor set simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
    imgPath1: "assets/categories/2.jpg",
    imgPath2: "assets/categories/2.jpg",
  ),
];




class Cake {
  final String name, imgPath, context;
  final double price;
  final bool added, isFavorite;

  Cake({
    required this.name,
    required this.price,
    required this.imgPath,
    required this.context,
    required this.added,
    required this.isFavorite,
  });
}

List<Cake> cake = [
  Cake(
    name: "Cookie classic",
    isFavorite: false,
    price: 1.99,
    added: true,
    context:
        "Lorem Dolor set simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
    imgPath: "assets/cookieclassic.jpg",
  ),
  /*Cake(
    name: "Cookie cream",
    isFavorite: true,
    price: 5.99,
    added: true,
    context:
        "Lorem Dolor set simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
    imgPath: "assets/cookievan.jpg",
  ),*/

  Cake(
    name: "Cookie mint",
    isFavorite: false,
    price: 3.99,
    added: true,
    context:
        "Lorem Dolor set simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
    imgPath: "assets/cookiemint.jpg",
  ),
  Cake(
    name: "Cookie choco",
    isFavorite: false,
    price: 2.99,
    added: true,
    context:
        "Lorem Dolor set simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
    imgPath: "assets/cookiechoco.jpg",
  ),
];
