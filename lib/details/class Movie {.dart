class Movie {
  String title;
  String category;
  String description;
  String image;
  String video;
  int price;
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
  DateTime dateDebut;
  DateTime dateFin;
  String price;
  String name;
  String time;

  TypeTicket({
    required this.dateDebut,
    required this.dateFin,
    required this.price,
    required this.name,
    required this.time,
  });

  factory TypeTicket.fromJson(Map<String, dynamic> json) {
    return TypeTicket(
      dateDebut: json['dateDebut'].toDate(),
      dateFin: json['dateFin'].toDate(),
      price:  json['price'] ?? '', 
      name:  json['name'] ?? '',
      time: json['time'] ?? '', 
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dateDebut': dateDebut,
      'dateFin': dateFin,
      'price' : price,
      'name' : name,
      'time' : time,
    };
  }
}

