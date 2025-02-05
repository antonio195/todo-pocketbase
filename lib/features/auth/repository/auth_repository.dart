import 'package:injectable/injectable.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable()
final class AuthRepository {
  AuthRepository({
    required PocketBase pb,
    required SharedPreferences sharedPreferences,
  })  : _pb = pb,
        _sharedPreferences = sharedPreferences;

  final PocketBase _pb;
  final SharedPreferences _sharedPreferences;

  Future<RecordModel> register({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      return await _pb.collection("users").create(
        body: {
          "password": password,
          "passwordConfirm": password,
          "email": email,
          "name": username,
        },
      );
    } on ClientException catch (_) {
      rethrow;
    } catch (_) {
      rethrow;
    }
  }

  Future<RecordAuth> login({
    required String email,
    required String password,
  }) async {
    try {
      final record = await _pb.collection("users").authWithPassword(email, password).then((auth) async {
        await _sharedPreferences.setString("JWT", auth.token);
      });

      return record;
    } on ClientException catch (_) {
      rethrow;
    } catch (_) {
      rethrow;
    }
  }
}
