import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cinema/models/comments.dart';
import 'package:get/get.dart';

class CommentController extends GetxController {
  final CollectionReference<Map<String, dynamic>> _commentsCollection =
      FirebaseFirestore.instance.collection("comments");

  // Méthode pour récupérer les commentaires associés à un film en fonction de son id et les trier par date d'arrivée
  Future<List<Comment>> getCommentsForMovie(String movieId) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _commentsCollection
              .where("movieId", isEqualTo: movieId)
             // .orderBy('dateTime', descending: true) // Trier par la propriété "dateTime" dans l'ordre descendant
              .get();
      final List<Comment> commentList = [];

      for (var doc in querySnapshot.docs) {
        final comment = Comment.fromJson(doc.data());
        commentList.add(comment);
      }

      return commentList;
    } catch (e) {
      print('Erreur lors de la récupération des commentaires : $e');
      return []; // Retourner une liste vide en cas d'erreur
    }
  }

  // Méthode pour ajouter un commentaire pour un film spécifique
 Future<void> addCommentForMovie(String movieId, String userId, String text) async {
  try {
    final comment = Comment(
      movieId: movieId,
      userId: userId,
      text: text,
      dateTime: DateTime.now(), // Ajouter la date et l'heure actuelles
    );

    await _commentsCollection.add(comment.toJson());
  } catch (e) {
    print('Erreur lors de l\'ajout du commentaire : $e');
  }
}

}
