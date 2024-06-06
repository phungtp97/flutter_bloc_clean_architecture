import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../shared/extension/extension.dart';
import '../../../../core/core.dart';
import '../../data.dart';

abstract class UserRemoteDataSource {
  Future<Either<Failure, UserModel>> login(String username, String password);

  Future<Either<Failure, UserModel>> register(String username, String password);

  Future<Either<Failure, UserModel>> getMe();
}

@Singleton(as: UserRemoteDataSource)
class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final SharedPreferences _prefServices;

  final String baseUrl;
  final Dio _userDio;
  final Dio _publicDio;

  UserRemoteDataSourceImpl(
      {required SharedPreferences prefServices,
      @Named('baseUrl') required this.baseUrl,
      @Named('userDio') required Dio userDio,
      @Named('publicDio') required Dio publicDio})
      : _prefServices = prefServices,
        _userDio = userDio,
        _publicDio = publicDio;

  @override
  Future<Either<Failure, UserModel>> login(
      String username, String password) async {
    final response = await _publicDio.post('/login',
        data: {'username': username, 'password': password}).connectionGuard();

    return response.parseGuard<UserModel>((json) => UserModel.fromJson(json));
  }

  @override
  Future<Either<Failure, UserModel>> register(
      String username, String password) async {
    final response = await _publicDio.post('/register',
        data: {'username': username, 'password': password}).connectionGuard();

    return response.parseGuard<UserModel>((json) => UserModel.fromJson(json));
  }

  @override
  Future<Either<Failure, UserModel>> getMe() async {
    final response = await _userDio.get('/me').loginGuard().connectionGuard();

    return response.parseGuard<UserModel>((json) => UserModel.fromJson(json));
  }
}
