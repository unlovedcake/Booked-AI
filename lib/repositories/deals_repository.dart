import 'package:booked_ai/models/deals_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DealsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<DealsModel>> fetchDeals() async {
    final querySnapshot = await _firestore.collection('deals').get();
    return querySnapshot.docs.map((doc) {
      return DealsModel.fromJson(doc.data());
    }).toList();
  }
}
