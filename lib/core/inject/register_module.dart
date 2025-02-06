import 'package:injectable/injectable.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @singleton
  PocketBase get pocketBase => PocketBase("https://ff6c-2804-7f0-b771-127d-a2f6-520f-9cdf-b56a.ngrok-free.app");

  @singleton
  Future<SharedPreferences> get sharedPreferences => SharedPreferences.getInstance();
}
