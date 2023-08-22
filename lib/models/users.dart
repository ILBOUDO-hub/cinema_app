class CustomUser {
  final String phoneNumber;
  final String lastName;
  final List<String> preferences; // Ajoutez cette propriété

  CustomUser({
    required this.phoneNumber,
    required this.lastName,
    required this.preferences, // Assurez-vous d'ajouter cette ligne
  });
}
