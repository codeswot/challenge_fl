import 'package:challenge_fl/products/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'product_repository.dart';

class FirebaseProductRepository implements ProductRepository {
  final productsCollection = FirebaseFirestore.instance.collection('products');

  @override
  Stream<List<Product>> products() {
    try {
      return productsCollection.snapshots().map((snapshot) {
        return snapshot.docs
            .map(
              (doc) => Product.fromSnapshot(doc),
            )
            .toList();
      });
    } catch (e) {
      rethrow;
    }
  }
}
