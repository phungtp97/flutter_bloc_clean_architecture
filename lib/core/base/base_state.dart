import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:use_state_utils/use_state_utils.dart';
import '../../generated/l10n.dart';
import '../command/command.dart';
import 'base.dart';

abstract class BaseState<S extends StatefulWidget, B extends BaseBloc> extends BaseStateNoBloc<S> with UseStateMixin {
  B bloc = GetIt.I.get<B>();

  @override
  @mustCallSuper
  initState() {
    super.initState();
    useStreamSubscription(key: 'command', stream: bloc.commandStream, onData: (event) {
      commandListener(event);
    });
  }
  void commandListener(Command c);
}

abstract class BaseStateNoBloc<E extends StatefulWidget> extends State<E> {
  S get localization => S.of(context);

  push<T>(String name, {Object? arguments}) => Navigator.of(context).pushNamed<T>(name, arguments: arguments);

  pushAndRemoveUntil<T extends Object?>(
      String name, {
        RoutePredicate? predicate,
        Object? arguments,
      }) =>
      Navigator.of(context).pushNamedAndRemoveUntil(name, predicate ?? (route) => false, arguments: arguments);

  Future<T?> popAndPushNamed<T extends Object?, TO extends Object?>(
      String name, {
        TO? result,
        Object? arguments,
      }) =>
      Navigator.of(context).popAndPushNamed(name, arguments: arguments, result: result);

  void pop<T extends Object?>([T? result]) => Navigator.of(context).pop(result);

  showLoadingDialog() {}

  closeLoadingDialog() {}
}
