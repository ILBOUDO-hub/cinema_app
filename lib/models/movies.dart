import 'package:cloud_firestore/cloud_firestore.dart';

class Movie {
  //DocumentReference<Map<String, dynamic>>? id;
  String title;
  String category;
  String description;
  String image;
  String video;

  Movie({
    //this.id,
    required this.category,
    required this.title,
    required this.image,
    required this.video,
    required this.description,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      //id: json['id'] ?? '',
      title: json['title'] ?? '',
      image: json['image'] ?? '',
      description: json['description'] ?? '',
      video: json['video'] ?? '',
      category: json['category'] ?? '',
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
    };
  }
}
