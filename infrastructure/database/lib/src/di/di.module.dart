//@GeneratedMicroModule;DatabasePackageModule;package:database/src/di/di.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:database/src/store/app_info/app_info.dart' as _i674;
import 'package:database/src/store/auth_session/auth_session.dart' as _i861;
import 'package:injectable/injectable.dart' as _i526;

class DatabasePackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.lazySingleton<_i674.AppInfoStore>(() => _i674.AppInfoStore());
    gh.lazySingleton<_i861.AuthSessionStore>(() => _i861.AuthSessionStore());
  }
}
