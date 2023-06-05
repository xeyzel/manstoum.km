import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inventory_app/data/model/warehouse/warehouse.dart';

class TransactionProvider {
  static final _instance = FirebaseFirestore.instance;
  static final _collection = _instance.collection('transactions');

  Future<bool> insertOne(Warehouse warehouse) async {
    final data = warehouse.toJson();
    data.remove('id');
    try {
      await _collection.add(data);
      return true;
    } on FirebaseException {
      rethrow;
    }
  }

  void findAll() {
    _collection.get();
  }
}
