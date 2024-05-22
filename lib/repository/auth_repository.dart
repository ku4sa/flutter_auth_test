import 'package:flutter/foundation.dart';
import 'package:flutter_auth_test/models/user/user.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class AuthRepository {
  late final Box<User> _savedUser;
  ValueNotifier<User?> user = ValueNotifier(null);

  final List<User> _users = [
    User(
      username: 'ku4sa',
      password: '12345678',
    ),
    User(
      username: 'user',
      password: '12345678',
    ),
    User(
      username: 'admin',
      password: '12345678',
    )
  ];

  Future<void> init() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    Hive.registerAdapter<User>(UserAdapter());
    _savedUser = await Hive.openBox('users');
    _getAuthorizedUser();
  }

  Future<HttpResponse> logIn(
      String username, String password, bool needToSave) async {
    await Future.delayed(
        const Duration(seconds: 3)); //иммитируем обработку данных
    try {
      final currentUser =
          _users.firstWhere((element) => element.username == username);

      if (currentUser.password == password) {
        if (needToSave) {
          await _saveUser(currentUser);
        }
        user = ValueNotifier(currentUser);
        return const HttpResponse(200, null);
      } else {
        return const HttpResponse(403, {'message': 'Неверный пароль'});
      }
    } catch (error) {
      return const HttpResponse(403, {'message': 'Пользователь не найден'});
    }
  }

  Future<void> _saveUser(User currentUser) async {
    assert(_savedUser.isOpen);

    await _savedUser.put('saved_user', currentUser);
  }

  void _getAuthorizedUser() {
    assert(_savedUser.isOpen);
    user = ValueNotifier(_savedUser.get('saved_user'));
  }

  Future<void> logOut() async {
    assert(_savedUser.isOpen);
    await _savedUser.delete('saved_user');
    user = ValueNotifier(null);
  }

  Future<void> dispose() async {
    await _savedUser.close();
  }
}

class HttpResponse {
  final int statusCode;
  final Map<String, dynamic>? body;

  const HttpResponse(this.statusCode, this.body);
}
