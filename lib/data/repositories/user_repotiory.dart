import 'package:image_picker/image_picker.dart';
import 'package:inventory_app/data/model/login/login.dart';
import 'package:inventory_app/data/model/product/product.dart';
import 'package:inventory_app/data/model/register/register.dart';
import 'package:inventory_app/data/model/user/user.dart';
import 'package:inventory_app/data/model/warehouse/warehouse.dart';
import 'package:inventory_app/data/providers/cloudinary_provider.dart';
import 'package:inventory_app/data/providers/product_provider.dart';
import 'package:inventory_app/data/providers/shared_provider.dart';
import 'package:inventory_app/data/providers/user_provider.dart';
import 'package:inventory_app/data/providers/warehouse_provider.dart';

class UserRepository {
  final _userProvider = UserProvider();
  final _shared = SharedProvider();
  final _warehouseProvider = WarehouseProvider();
  final _productProvider = ProductProvider();
  final _cloudinaryProvider = CloudinaryProvider();

  /// User Management
  Future<bool> register(Register register) => _userProvider.register(register);

  Future<String> login(Login login) => _userProvider.login(login);

  Future<User> getUser() async {
    final userId = await getUserId();
    final user = await _userProvider.getUser(userId!);
    return user;
  }

  Future<bool> saveUserId(String id) => _shared.saveUserId(id);

  Future<bool> removeUserId() => _shared.removeUserId();

  Future<String?> getUserId() => _shared.getUserId();

  /// Warehouse Management
  Future<bool> insertWarehouse(Warehouse warehouse) async {
    final userId = (await getUserId())!;
    return _warehouseProvider.insertOne(warehouse.copyWith(userId: userId));
  }

  Future<Iterable<Warehouse>> findAllWarehouse() async {
    final userId = (await getUserId())!;
    return _warehouseProvider.findAll(userId);
  }

  Future<Warehouse> findOneWarehouse(String warehouseId) =>
      _warehouseProvider.findOne(warehouseId);

  //Product Management
  Future<bool> insertProduct(Product product) async {
    final userId = (await getUserId())!;
    return _productProvider.insertOne(product.copyWith(userId: userId));
  }

// Storage Management
  Future<String?> uploadImage(XFile imageFile) =>
      _cloudinaryProvider.uploadImage(imageFile);
// get product
  Future<Iterable<Product>> findAllProduct() async {
    final userId = (await getUserId())!;
    return _productProvider.findAll(userId);
  }
}
