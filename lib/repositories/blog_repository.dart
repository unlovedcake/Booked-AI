import 'package:booked_ai/models/blog_model.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class BlogRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<BlogModel>> fetchBlogs() async {
    final querySnapshot = await _firestore.collection('blogs').get();
    return querySnapshot.docs.map((doc) {
      return BlogModel.fromJson(doc.data());
    }).toList();
  }
}
