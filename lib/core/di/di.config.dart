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
import 'package:flutter_modular_architecture/src/auth/domain/usecase/auth.dart'
    as _i392;
import 'package:flutter_modular_architecture/src/auth/presentation/bloc/auth_bloc.dart'
    as _i823;
import 'package:flutter_modular_architecture/src/home/data/repository/product_repository_impl.dart'
    as _i59;
import 'package:flutter_modular_architecture/src/home/data/source/product_data_source/product_ds.dart'
    as _i1021;
import 'package:flutter_modular_architecture/src/home/data/source/product_data_source/product_ds_impl.dart'
    as _i561;
import 'package:flutter_modular_architecture/src/home/domain/get_product_list/get_product_list_usecase.dart'
    as _i286;
import 'package:flutter_modular_architecture/src/home/domain/product_repository/product_repository.dart'
    as _i436;
import 'package:flutter_modular_architecture/src/home/presentation/bloc/home_bloc.dart'
    as _i371;
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
    gh.factory<_i1021.ProductDataSource>(
      () => _i561.ArticleDataSourceImpl(gh<_i372.NetworkClient>()),
    );
    gh.factory<_i779.AuthRemoteDS>(
      () => _i165.AuthRemoteDSImpl(
        gh<_i310.AuthEndpoints>(),
        gh<_i372.NetworkClient>(),
      ),
    );
    gh.factory<_i436.ProductRepository>(
      () => _i59.ProductRepositoryImpl(
        articleDataSource: gh<_i1021.ProductDataSource>(),
      ),
    );
    gh.factory<_i286.GetProductListUseCase>(
      () => _i286.GetProductListUseCase(gh<_i436.ProductRepository>()),
    );
    gh.factory<_i696.AuthRepository>(
      () => _i917.AuthRepositoryImpl(gh<_i779.AuthRemoteDS>()),
    );
    gh.factory<_i371.HomeBloc>(
      () => _i371.HomeBloc(gh<_i286.GetProductListUseCase>()),
    );
    gh.factory<_i392.AuthUC>(() => _i392.AuthUC(gh<_i696.AuthRepository>()));
    gh.factory<_i823.AuthBloc>(() => _i823.AuthBloc(gh<_i392.AuthUC>()));
    return this;
  }
}
