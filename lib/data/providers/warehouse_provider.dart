import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inventory_app/data/model/warehouse/warehouse.dart';

class WarehouseProvider {
  static final _instance = FirebaseFirestore.instance;
  static final _collection = _instance.collection('warehouses');

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

  Future<Iterable<Warehouse>> findAll() async {
    try {
      final snapshot = await _collection.get();
      snapshot.docs.forEach((element) {
        print(element);
      });

      return snapshot.docs
          .map((e) => Warehouse.fromJson(e.data()).copyWith(id: e.id));
    } on FirebaseFirestore {
      rethrow;
    }
  }

  void findOne() {}

  void updateOne() {}

  void deleteOne() {}
}
