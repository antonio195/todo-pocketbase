import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_pocketbase/features/auth/repository/auth_repository.dart';

@singleton
final class AuthController extends ChangeNotifier {
  AuthController({
    required AuthRepository repository,
    required SharedPreferences sharedPreferences,
  })  : _repository = repository,
        _sharedPreferences = sharedPreferences;

  final AuthRepository _repository;
  final SharedPreferences _sharedPreferences;

  late final BuildContext _context;

  void register({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      await _repository.register(
        username: username,
        email: email,
        password: password,
      );
      showNotification("Cadastrado com sucesso");

    } on ClientException catch (e) {
      showNotification("${e.response}");
    } catch (e) {
      showNotification(e.toString());
    }
  }

  void login({
    required String email,
    required String password,
    required void Function() onSuccess,
  }) async {
    try {
      await _repository.login(
        email: email,
        password: password,
      );
      showNotification("Logado com sucesso");
      onSuccess();
    } on ClientException catch (e) {
      showNotification("${e.response}");
    } catch (e) {
      showNotification(e.toString());
    }
  }

  void showNotification(String message) {
    ScaffoldMessenger.of(_context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void setContext(BuildContext context) => _context = context;
}
