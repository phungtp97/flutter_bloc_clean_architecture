import 'package:dio/dio.dart';
import 'package:dio_log/interceptor/dio_log_interceptor.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../shared/extension/extension.dart';

@module
abstract class RegisterModule {

  SharedPreferences? _prefs;

  @preResolve
  @singleton
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @Named('trackerId')
  String get trackerId => '1234567890';

  @Named('env')
  String get env => 'dev';

  @Named('baseUrl')
  String get baseUrl => 'https://api.yourhost.com';

  @preResolve
  @singleton
  @Named('userDio')
  Future<Dio> get userDio async {
    final dio = Dio();

    dio.interceptors.add(DioLogInterceptor());
    dio.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          if (options.method == 'POST') {
            options.headers['Content-Type'] = 'application/json';
          }
          if (_prefs!.token != null &&
              !options.headers.containsKey('Authorization')) {
            options.headers['Authorization'] =
            'Bearer ${_prefs!.token}';
          }
          //NetworkInspector().addLog();
          return handler.next(options);
        }, onResponse: (response, handler) async {
      //NetworkInspector().addLog();
      return handler.next(response);
    }, onError: (e, handler) async {
      //NetworkInspector().addLog();
      return handler.next(e);
    }));
    return dio;
  }

  @Named('publicDio')
  @singleton
  Dio get publicDio {
    final dio = Dio();

    return dio;
  }
}