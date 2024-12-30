import 'package:cloud_firestore/cloud_firestore.dart';

class ExploreModel {
  final String id;
  final String image;
  final String title;
  final String description;
  final String location;
  final String activity;
  final String userName;
  final String userImage;
  final DateTime createdAt;

  ExploreModel({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.location,
    required this.activity,
    required this.userName,
    required this.userImage,
    required this.createdAt,
  });

  factory ExploreModel.fromJson(Map<String, dynamic> json) {
    return ExploreModel(
      id: json['id'],
      image: json['image'],
      title: json['title'],
      description: json['description'],
      location: json['location'],
      activity: json['activity'],
      userName: json['userName'],
      userImage: json['userImage'],
      createdAt: (json['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'title': title,
      'description': description,
      'location': location,
      'activity': activity,
      'userName': userName,
      'userImage': userImage,
      'createdAt': createdAt,
    };
  }
}
