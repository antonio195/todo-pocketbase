// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pocketbase/pocketbase.dart' as _i169;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/auth/controller/auth_controller.dart' as _i593;
import '../../features/auth/repository/auth_repository.dart' as _i871;
import '../pocketbase/pocket_base_core.dart' as _i909;
import 'register_module.dart' as _i291;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i909.PocketBaseCore>(() => _i909.PocketBaseCore());
    gh.singleton<_i169.PocketBase>(() => registerModule.pocketBase);
    gh.singletonAsync<_i460.SharedPreferences>(
        () => registerModule.sharedPreferences);
    gh.factoryAsync<_i871.AuthRepository>(() async => _i871.AuthRepository(
          pb: gh<_i169.PocketBase>(),
          sharedPreferences: await getAsync<_i460.SharedPreferences>(),
        ));
    gh.singletonAsync<_i593.AuthController>(() async => _i593.AuthController(
          repository: await getAsync<_i871.AuthRepository>(),
          sharedPreferences: await getAsync<_i460.SharedPreferences>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i291.RegisterModule {}
