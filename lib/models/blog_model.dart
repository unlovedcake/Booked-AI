import 'package:cloud_firestore/cloud_firestore.dart';

class BlogModel {
  final String id;
  final String image;
  final String title;
  final String description;
  final DateTime createdAt;

  BlogModel({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.createdAt,
  });

  factory BlogModel.fromJson(Map<String, dynamic> json) {
    return BlogModel(
      id: json['id'],
      image: json['image'],
      title: json['title'],
      description: json['description'],
      createdAt: (json['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'title': title,
      'description': description,
      'createdAt': createdAt,
    };
  }
}
