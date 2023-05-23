import 'package:inventory_app/data/model/login/login.dart';
import 'package:inventory_app/data/model/register/register.dart';
import 'package:inventory_app/data/model/user/user.dart';
import 'package:inventory_app/data/providers/shared_provider.dart';
import 'package:inventory_app/data/providers/user_provider.dart';

class UserRepository {
  final _provider = UserProvider();

  final _shared = SharedProvider();

  Future<bool> register(Register register) => _provider.register(register);

  Future<String> login(Login login) => _provider.login(login);

  Future<User> getUser() async {
    final userId = await getUserId();
    final user = await _provider.getUser(userId!);
    return user;
  }

  Future<bool> saveUserId(String id) => _shared.saveUserId(id);

  Future<bool> removeUserId() => _shared.removeUserId();

  Future<String?> getUserId() => _shared.getUserId();
}
