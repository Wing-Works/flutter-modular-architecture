// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:database/database.dart' as _i252;
import 'package:flutter_modular_architecture/src/auth/data/repository/auth.dart'
    as _i917;
import 'package:flutter_modular_architecture/src/auth/data/source/auth_remote_ds.dart'
    as _i779;
import 'package:flutter_modular_architecture/src/auth/data/source/auth_remote_ds_impl.dart'
    as _i165;
import 'package:flutter_modular_architecture/src/auth/domain/endpoints/auth_endpoints.dart'
    as _i310;
import 'package:flutter_modular_architecture/src/auth/domain/repository/auth.dart'
    as _i696;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:network/network.dart' as _i372;
import 'package:shared/shared.dart' as _i811;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    await _i252.DatabasePackageModule().init(gh);
    await _i372.NetworkPackageModule().init(gh);
    await _i811.SharedPackageModule().init(gh);
    gh.factory<_i310.AuthEndpoints>(
      () => _i310.AuthEndpoints(gh<_i811.NetworkPathResolver>()),
    );
    gh.factory<_i779.AuthRemoteDS>(
      () => _i165.AuthRemoteDSImpl(
        gh<_i310.AuthEndpoints>(),
        gh<_i372.NetworkClient>(),
      ),
    );
    gh.factory<_i696.AuthRepository>(
      () => _i917.AuthRepositoryImpl(gh<_i779.AuthRemoteDS>()),
    );
    return this;
  }
}
