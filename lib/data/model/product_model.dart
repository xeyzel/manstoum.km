abstract class ProductModel {
  String name;
  String description;
  String categoryName;
  int stock;
  int price;
  bool isIn;

  ProductModel({
    required this.name,
    required this.description,
    required this.categoryName,
    required this.stock,
    required this.price,
    required this.isIn,
  });
}
