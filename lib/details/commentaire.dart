import 'package:cinema/controllers/userController.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CommentPage extends StatefulWidget {
  final String movieId;

  CommentPage({required this.movieId});

  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  final UserController userController = Get.find<UserController>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final CollectionReference commentsCollection =
      FirebaseFirestore.instance.collection('comments');

  void _postComment() {
    final String name =
        userController.user?.firstName ?? 'Utilisateur non connecté';
    final String message = _messageController.text.trim();

    if (name.isNotEmpty && message.isNotEmpty) {
      commentsCollection.add({
        'name': name,
        'message': message,
        'movieId': widget.movieId,
      });

      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Laisser un commentaire'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: commentsCollection
                  .where('movieId', isEqualTo: widget.movieId)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                      child: Text('Erreur de chargement des commentaires.'));
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                final comments = snapshot.data!.docs;

                return ListView.builder(
                    itemCount: comments.length,
                    itemBuilder: (context, index) {
                      final comment =
                          comments[index].data() as Map<String, dynamic>;
                      final name = comment['name'] ?? '';
                      final message = comment['message'] ?? '';
                      return ListTile(
                        subtitle: Text(message,style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),),
                        title: Text(
                          name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      );
                    });
              },
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(labelText: 'Message'),
                  ),
                ),
                ElevatedButton(
                  onPressed: _postComment,
                  child: const Text('Envoyer'),
                ),
              ]))
        ],
      ),
    );
  }
}
