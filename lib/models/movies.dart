import 'package:cloud_firestore/cloud_firestore.dart';

class Movie {
  //DocumentReference<Map<String, dynamic>>? id;
  String title;
  String category;
  String description;
  String image;
  String video;
  String price;
  String room;
  DateTime endDate;
  DateTime startDate;

  Movie({
    //this.id,
    required this.category,
    required this.title,
    required this.image,
    required this.video,
    required this.description,
    required this.price,
    required this.room,
    required this.endDate,
    required this.startDate,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      //id: json['id'] ?? '',
      title: json['title'] ?? '',
      image: json['image'] ?? '',
      description: json['description'] ?? '',
      video: json['video'] ?? '',
      category: json['category'] ?? '',
      price: json['price'] ?? '',
      room: json['room'] ?? '',
      endDate: json['endDate'] ?? '',
      startDate: json['startDate'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      //'id': id,
      'title': title,
      'image': image,
      'description': description,
      'video': video,
      'category': category,
      'price': price,
      'room': room,
      'endDate': endDate,
      'startDate': startDate,
    };
  }
}
