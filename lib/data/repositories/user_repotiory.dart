import 'package:inventory_app/data/model/login/login.dart';
import 'package:inventory_app/data/model/register/register.dart';
import 'package:inventory_app/data/model/user/user.dart';
import 'package:inventory_app/data/model/warehouse/warehouse.dart';
import 'package:inventory_app/data/providers/shared_provider.dart';
import 'package:inventory_app/data/providers/user_provider.dart';
import 'package:inventory_app/data/providers/warehouse_provider.dart';

class UserRepository {
  final _userProvider = UserProvider();
  final _shared = SharedProvider();
  final _warehouseProvider = WarehouseProvider();

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
  Future<bool> insertWarehouse(Warehouse warehouse) =>
      _warehouseProvider.insertOne(warehouse);

  Future<Iterable<Warehouse>> findAllWarehouse() =>
      _warehouseProvider.findAll();
}
