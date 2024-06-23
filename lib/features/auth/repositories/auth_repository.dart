
import 'package:mytodo_mobx_app/features/auth/models/login/login.dart';

abstract class AuthRepository {
  Future<Login> loginUser(String email, password);
}