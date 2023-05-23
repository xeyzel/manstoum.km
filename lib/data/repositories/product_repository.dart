import 'package:inventory_app/data/model/product/product.dart';
import 'package:inventory_app/data/providers/product_provider.dart';

class ProductRepository {
  final _provider = ProductProvider();
  Future<bool> insert(Product product) => _provider.insertOne(product);
}
