class Movie {
  int idMovies;
  String title;
  String category;
  String description;
  String image;
  String video;
  int price;
  String room;

  Movie({
    required this.idMovies,
    required this.category,
    required this.title,
    required this.image,
    required this.video,
    required this.description,
    required this.price,
    required this.room,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      idMovies: json['idMovies'] ?? 0,
      title: json['title'] ?? '',
      image: json['image'] ?? '',
      description: json['description'] ?? '',
      video: json['video'] ?? '',
      category: json['category'] ?? '',
      price: json['price'] ?? 0,
      room: json['room'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idMovies': idMovies,
      'title': title,
      'image': image,
      'description': description,
      'video': video,
      'category': category,
      'price': price,
      'room': room,
    };
  }
}

class Ticket {
  DateTime dateDebut;
  DateTime dateFin;
  int price;
  String name;
  String time;
  int idMovies;
  int quantity;
  int vente;

  Ticket({
    required this.dateDebut,
    required this.dateFin,
    required this.price,
    required this.name,
    required this.time,
    required this.idMovies,
    required this.quantity,
    required this.vente,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      dateDebut: json['dateDebut'].toDate(),
      dateFin: json['dateFin'].toDate(),
      price: json['price'] ?? 0,
      name: json['name'] ?? '',
      time: json['time'] ?? '',
      idMovies: json['idMovies'] ?? 0,
      quantity: json['quantity'] ?? 0,
      vente: json['vente'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dateDebut': dateDebut,
      'dateFin': dateFin,
      'price': price,
      'name': name,
      'time': time,
      'idMovies': idMovies,
      'quantity': quantity,
      'vente': vente,
    };
  }
}
