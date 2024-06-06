import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc_arch/shared/extension/extension.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/core.dart';

extension ResponseExt on Response<dynamic> {
  Future<Either<Failure, T>> parseGuard<T>(
      T Function(dynamic json) jsonParser) async {
    try {
      var response = this;
      return Right(jsonParser(response.data));
    } on DioError catch (dioError) {
      if (dioError.type == DioErrorType.response) {
        switch (dioError.response?.statusCode) {
          case 400:
            throw BadRequestFailure(dioError);
          case 401:
            throw UnauthorizedFailure(dioError);
          case 404:
            throw NotFoundFailure(dioError);
          case 500:
            throw InternalServerFailure(dioError);
          case 403:
            throw ForbiddenFailure(dioError);
          case 405:
            throw MethodNotAllowedFailure(dioError);
          case 406:
            throw NotAcceptableFailure(dioError);
          default:
            throw HttpUnknownFailure(dioError);
        }
      } else if (dioError.type == DioErrorType.connectTimeout) {
        throw ConnectTimeoutFailure(dioError);
      } else if (dioError.type == DioErrorType.sendTimeout) {
        throw SendTimeoutFailure(dioError);
      } else if (dioError.type == DioErrorType.receiveTimeout) {
        throw ReceiveTimeoutFailure(dioError);
      } else {
        throw ServerUnknownFailure(dioError);
      }
    } on Exception catch (e) {
      throw NetworkUnknownError(e);
    }
  }
}

extension ResponseFutureExt<T> on Future<Response<T>> {
  Future<Response<T>> connectionGuard() async {
    var isConnected = await GetIt.I.get<NetworkInfo>().isConnected;
    if (isConnected) {
      return this;
    } else {
      throw const ConnectionFailure();
    }
  }

  Future<Response<T>> loginGuard() async {
    var hasToken = GetIt.I.get<SharedPreferences>().token != null;

    if(hasToken) {
      return this;
    } else {
      throw const NotLoginFailure();
    }
  }
}
