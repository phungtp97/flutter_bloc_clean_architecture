// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:flutter_bloc_arch/core/module/register_module.dart' as _i18;
import 'package:flutter_bloc_arch/feature/data/data.dart' as _i6;
import 'package:flutter_bloc_arch/feature/data/datasource/local/locale_local_data_source.dart'
    as _i9;
import 'package:flutter_bloc_arch/feature/data/datasource/remote/user_remote_data_source.dart'
    as _i5;
import 'package:flutter_bloc_arch/feature/domain/domain.dart' as _i15;
import 'package:flutter_bloc_arch/feature/domain/repository/local_repository.dart'
    as _i10;
import 'package:flutter_bloc_arch/feature/domain/repository/user_repository.dart'
    as _i7;
import 'package:flutter_bloc_arch/feature/domain/usecase/locale/get_locale.dart'
    as _i16;
import 'package:flutter_bloc_arch/feature/domain/usecase/locale/set_locale.dart'
    as _i13;
import 'package:flutter_bloc_arch/feature/domain/usecase/user/get_me.dart'
    as _i8;
import 'package:flutter_bloc_arch/feature/domain/usecase/user/login_user.dart'
    as _i11;
import 'package:flutter_bloc_arch/feature/domain/usecase/user/register_user.dart'
    as _i12;
import 'package:flutter_bloc_arch/feature/presentation/blocs/app/app_bloc.dart'
    as _i17;
import 'package:flutter_bloc_arch/feature/presentation/blocs/auth/auth_bloc.dart'
    as _i14;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.singletonAsync<_i3.Dio>(
      () => registerModule.userDio,
      instanceName: 'userDio',
      preResolve: true,
    );
    gh.singleton<_i3.Dio>(
      () => registerModule.publicDio,
      instanceName: 'publicDio',
    );
    await gh.singletonAsync<_i4.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.factory<String>(
      () => registerModule.trackerId,
      instanceName: 'trackerId',
    );
    gh.factory<String>(
      () => registerModule.env,
      instanceName: 'env',
    );
    gh.factory<String>(
      () => registerModule.baseUrl,
      instanceName: 'baseUrl',
    );
    gh.singleton<_i5.UserRemoteDataSource>(() => _i5.UserRemoteDataSourceImpl(
          prefServices: gh<_i4.SharedPreferences>(),
          baseUrl: gh<String>(instanceName: 'baseUrl'),
          userDio: gh<_i3.Dio>(instanceName: 'userDio'),
          publicDio: gh<_i3.Dio>(instanceName: 'publicDio'),
        ));
    gh.lazySingleton<_i6.UserRepository>(() => _i7.UserRepositoryIml(
        userRemoteDataSource: gh<_i6.UserRemoteDataSource>()));
    gh.factory<_i8.GetMe>(() => _i8.GetMe(gh<_i6.UserRepository>()));
    gh.singleton<_i9.LocaleLocalDataSource>(() => _i9.LocaleLocalDataSourceImpl(
        sharedPreferences: gh<_i4.SharedPreferences>()));
    gh.lazySingleton<_i6.LocaleRepository>(() => _i10.LocaleRepositoryIml(
        sharedPreferences: gh<_i4.SharedPreferences>()));
    gh.factory<_i11.LoginUser>(() => _i11.LoginUser(gh<_i6.UserRepository>()));
    gh.factory<_i12.RegisterUser>(
        () => _i12.RegisterUser(gh<_i6.UserRepository>()));
    gh.factory<_i13.SetLocale>(
        () => _i13.SetLocale(repository: gh<_i6.LocaleRepository>()));
    gh.factory<_i14.AuthBloc>(() => _i14.AuthBloc(
          gh<_i15.LoginUser>(),
          gh<_i15.RegisterUser>(),
        ));
    gh.factory<_i16.GetLocale>(
        () => _i16.GetLocale(repository: gh<_i6.LocaleRepository>()));
    gh.singleton<_i17.AppBloc>(
      () => _i17.AppBloc(
        setLocaleUseCase: gh<_i15.SetLocale>(),
        getLocaleUseCase: gh<_i15.GetLocale>(),
        getMeUseCase: gh<_i15.GetMe>(),
      ),
      dispose: (i) => i.dispose(),
    );
    return this;
  }
}

class _$RegisterModule extends _i18.RegisterModule {}
