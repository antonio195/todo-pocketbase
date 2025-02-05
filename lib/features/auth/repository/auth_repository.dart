import 'package:injectable/injectable.dart';
import 'package:pocketbase/pocketbase.dart';

@Injectable()
final class AuthRepository {
  AuthRepository({
    required PocketBase pb,
  }) : _pb = pb;

  final PocketBase _pb;

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
    }catch(_){
      rethrow;
    }
  }
}
