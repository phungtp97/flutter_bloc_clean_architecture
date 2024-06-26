import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../feature/presentation/pages/pages.dart';
import 'route_arguments.dart';

class Routes {
  //? Splash route
  static const String splash = '/';

  static const String home = '/home';

  static const String auth = '/auth';

  static getRoute(RouteSettings settings) {
    Widget widget;
    try {
      if (settings.name == Routes.splash) {
        widget = const SplashPage();
      } else {
        widget = GetIt.I.get<Widget>(instanceName: settings.name);
      }
    } catch (e, stackTrace) {
      //Sentry
      widget = Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Builder(
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
                child: Text(
                  '${settings.name} not found',
                  textAlign: TextAlign.center,
                ),
              );
            },
          ),
        ),
      );
    }

    if (settings.arguments is RouteArguments &&
        !(settings.arguments as RouteArguments).opaque) {
      RouteSettings newSettings = RouteSettings(
          name: settings.name,
          arguments: (settings.arguments as RouteArguments).data);
      return PageRouteBuilder(
          opaque: false,
          pageBuilder: (_, __, ___) => widget,
          settings: newSettings);
    }

    return CupertinoPageRoute(
      builder: (_) => widget,
      settings: settings,
    );
  }
}
