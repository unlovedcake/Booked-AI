import 'package:cloud_firestore/cloud_firestore.dart';

class DealsModel {
  String image;
  String title;
  String description;
  DateTime createdAt;
  List<DealsDetails> dealsDetails;

  DealsModel({
    required this.image,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.dealsDetails,
  });

  // Factory constructor for creating an instance from Firestore JSON
  factory DealsModel.fromJson(Map<String, dynamic> json) {
    return DealsModel(
      image: json['image'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      createdAt: (json['createdAt'] as Timestamp).toDate(),
      dealsDetails: (json['dealsDetails'] as List<dynamic>)
          .map((detail) => DealsDetails.fromJson(detail as Map<String, dynamic>))
          .toList(),
    );
  }

  // Method to convert an instance to Firestore-compatible JSON
  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'title': title,
      'description': description,
      'createdAt': createdAt,
      'dealsDetails': dealsDetails.map((detail) => detail.toJson()).toList(),
    };
  }
}

class DealsDetails {
  DateTime dateAvailable;
  String from;
  String name;
  double price;
  String to;
  String type;

  DealsDetails({
    required this.dateAvailable,
    required this.from,
    required this.name,
    required this.price,
    required this.to,
    required this.type,
  });

  // Factory constructor for creating an instance from Firestore JSON
  factory DealsDetails.fromJson(Map<String, dynamic> json) {
    return DealsDetails(
      dateAvailable: (json['dateAvailable'] as Timestamp).toDate(),
      from: json['from'] ?? '',
      name: json['name'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      to: json['to'] ?? '',
      type: json['type'] ?? '',
    );
  }

  // Method to convert an instance to Firestore-compatible JSON
  Map<String, dynamic> toJson() {
    return {
      'dateAvailable': dateAvailable,
      'from': from,
      'name': name,
      'price': price,
      'to': to,
      'type': type,
    };
  }
}
