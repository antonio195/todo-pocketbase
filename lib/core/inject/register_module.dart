import 'package:injectable/injectable.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @singleton
  PocketBase get pocketBase => PocketBase("https://004c-2804-7f0-b771-127d-f443-1108-5d0a-9bed.ngrok-free.app");

  @singleton
  Future<SharedPreferences> get sharedPreferences => SharedPreferences.getInstance();
}
