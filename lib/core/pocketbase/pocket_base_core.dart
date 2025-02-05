import 'package:injectable/injectable.dart';
import 'package:pocketbase/pocketbase.dart';

@Injectable()
final class PocketBaseCore {
  final PocketBase _pb = PocketBase("https://7708-2804-7f0-b771-127d-c5cd-5158-4416-8946.ngrok-free.app");

  PocketBase get instance => _pb;

}