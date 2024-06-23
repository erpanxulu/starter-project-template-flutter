

import 'package:mytodo_mobx_app/core/services/restful/api_service.dart';
import 'package:mytodo_mobx_app/features/auth/models/login/login.dart';
import 'package:mytodo_mobx_app/features/auth/repositories/auth_repository.dart';
import 'package:mytodo_mobx_app/injection.dart';

class AuthRepositoryImpl extends AuthRepository {
  final _service = sl<ApiService>();
  @override
  Future<Login> loginUser(String email, password) async {
    try {
      final result = await _service.postData('/login', {
        'email': email,
        'password': password,
      });
      return Login.fromJson(result);
    } catch (e) {
      throw Exception(e);
    }
  }
}