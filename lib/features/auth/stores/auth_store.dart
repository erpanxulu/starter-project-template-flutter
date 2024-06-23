
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:mytodo_mobx_app/features/auth/models/login/login.dart';
import 'package:mytodo_mobx_app/features/auth/repositories/auth_repository.dart';
import 'package:mytodo_mobx_app/injection.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  final AuthRepository _repository = sl<AuthRepository>();

  @observable
  Login login = Login();

  @observable
  bool isLoading = false;

  @observable
  String errorMessage = '';

  @action
  Future<void> loginUser(String email, password, BuildContext context) async {
    isLoading = true;
    errorMessage = '';
    try {
      final data = await _repository.loginUser(email, password);
      debugPrint("gggg");
      login = data;
      // ignore: use_build_context_synchronously
      context.go('/home');
    }  catch (e) {
      errorMessage = e.toString();
      debugPrint("gggg222 $e");
    } finally {
      isLoading = false;
    }
  }

}