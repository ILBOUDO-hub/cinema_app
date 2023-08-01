import 'package:cloud_firestore/cloud_firestore.dart';

class Comment {
  final String movieId;
  final String userId;
  final String text;
  final DateTime dateTime; // Ajout de la propriété pour la date et l'heure

  Comment({
    required this.movieId,
    required this.userId,
    required this.text,
    required this.dateTime,
  });

  // Convertir un commentaire en un document JSON
  Map<String, dynamic> toJson() {
    return {
      'movieId': movieId,
      'userId': userId,
      'text': text,
      'dateTime': Timestamp.fromDate(dateTime), // Convertir la date en Timestamp
    };
  }

  // Créer un commentaire à partir d'un document JSON
  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      movieId: json['movieId'],
      userId: json['userId'],
      text: json['text'],
      dateTime: (json['dateTime'] as Timestamp).toDate(), // Convertir le Timestamp en date
    );
  }
}
