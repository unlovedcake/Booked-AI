import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/explore_model.dart';

class ExploreRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ExploreModel>> fetchExplores() async {
    try {
      final querySnapshot = await _firestore.collection('explores').get();
      return querySnapshot.docs.map((doc) {
        return ExploreModel.fromJson(doc.data());
      }).toList();
    } catch (e) {
      throw Exception('Error fetching explores: $e');
    }
  }
}
