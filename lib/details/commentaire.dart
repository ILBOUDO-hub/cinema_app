import 'package:cinema/controllers/commentController.dart';
import 'package:cinema/function.dart';
import 'package:cinema/models/comments.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentPage extends StatelessWidget {
  final String movieId;
  final CommentController commentController = Get.put(CommentController());
  final TextEditingController newCommentController = TextEditingController();

  CommentPage({required this.movieId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Commentaires'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<Comment>>(
              future: commentController.getCommentsForMovie(movieId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                        'Une erreur est survenue lors du chargement des commentaires'),
                  );
                } else {
                  final List<Comment> comments = snapshot.data ?? [];
                  if (comments.isEmpty) {
                    return Center(
                      child: Text('Aucun commentaire pour ce film'),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: comments.length,
                      itemBuilder: (context, index) {
                        final Comment comment = comments[index];
                        return ListTile(
                          subtitle: Text(comment.text),
                          title: Text(
                            '${comment.userId}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        );
                      },
                    );
                  }
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: newCommentController,
                    decoration: InputDecoration(
                      hintText: 'Entrez votre commentaire...',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    String commentText = newCommentController.text;
                    // Utilisez le CommentController pour ajouter le commentaire
                    await commentController.addCommentForMovie(
                      movieId,
                      (user?.uid ?? ""), // Remplacez par l'ID de l'utilisateur
                      commentText,
                    );
                    // Effacez le champ de saisie après avoir ajouté le commentaire
                    newCommentController.clear();
                  },
                  child: Text('Envoyer'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
