import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:todo_pocketbase/features/auth/repository/auth_repository.dart';

@Injectable()
final class AuthController extends ChangeNotifier {
  AuthController({
    required AuthRepository repository,
  }) : _repository = repository;

  final AuthRepository _repository;

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

  void showNotification(String message) {
    ScaffoldMessenger.of(_context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void setContext(BuildContext context) => _context = context;
}
