import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inventory_app/data/model/product/product.dart';

class ProductProvider {
  static final _instance = FirebaseFirestore.instance;
  static final _collection = _instance.collection("products");

  Future<bool> insertOne(Product product) async {
    try {
      final data = product.toJson();
      data.remove('id');
      final proudct = _collection.add(data);
      return true;
    } on FirebaseException {
      rethrow;
    }
  }

  void deleteOne(String id) {}

  void updateOne(String id, Product product) {}

  void findOne(String id) {}

  void findAll() {}

  void findByUserIdAndWarehouseId() {}

  void findByUserId(String userId) {}

  void deleteAll() {}
}
