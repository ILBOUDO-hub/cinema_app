class CustomUser {
  final String phoneNumber;
  final String lastName;
   final String firstName;
  final List<String> preferences; // Ajoutez cette propriété

  CustomUser({
    required this.phoneNumber,
    required this.lastName,
    required this.firstName,
    required this.preferences, // Assurez-vous d'ajouter cette ligne
  });
}
