class Movie {
  String ?id;
  String title;
  String category;
  String description;
  String image;
  String video;
  String price;
  String room;
  List<TypeTicket> typeTickets;

  Movie({
    required this.category,
    required this.title,
    required this.image,
    required this.video,
    required this.description,
    required this.price,
    required this.room,
    required this.typeTickets,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    List<dynamic>? typeTicketList = json['typeTickets'];

    // Vérifier si la valeur est null ou une liste valide
    if (typeTicketList == null) {
      typeTicketList = [];
    }

    List<TypeTicket> typeTickets =
        typeTicketList.map((json) => TypeTicket.fromJson(json)).toList();

    return Movie(
      title: json['title'] ?? '',
      image: json['image'] ?? '',
      description: json['description'] ?? '',
      video: json['video'] ?? '',
      category: json['category'] ?? '',
      price: json['price'] ?? '',
      room: json['room'] ?? '',
      typeTickets: typeTickets,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'image': image,
      'description': description,
      'video': video,
      'category': category,
      'price': price,
      'room': room,
      'typeTickets': typeTickets.map((ticket) => ticket.toJson()).toList(),
    };
  }
}

class TypeTicket {
  String id; // Nouvel attribut pour l'identifiant du ticket
  DateTime dateDebut;
  DateTime dateFin;
  String price;
    bool isAvailable; // Nouvelle propriété pour indiquer si le ticket est disponible pour la date sélectionnée


  TypeTicket({
    required this.id,
    required this.dateDebut,
    required this.dateFin,
    required this.price,
        this.isAvailable = true, // Par défaut, le ticket est considéré comme disponible
  });

  factory TypeTicket.fromJson(Map<String, dynamic> json) {
    return TypeTicket(
      id: json['id'] ?? '', // Utilisez l'opérateur ?? pour fournir une valeur par défaut
      dateDebut: json['dateDebut'].toDate(),
      dateFin: json['dateFin'].toDate(),
      price:  json['price'] ?? '', // Utilisez l'opérateur ?? pour fournir une valeur par défaut
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id, // Utilisez 'id' pour l'attribut 'id'
      'dateDebut': dateDebut,
      'dateFin': dateFin,
      'price' : price,
    };
  }
}

