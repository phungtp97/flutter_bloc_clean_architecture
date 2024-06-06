import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';
import '../command/command.dart';
import '../core.dart';
class BaseBloc<S extends Equatable> extends Cubit<S> {
  BaseBloc(super.initialState);
  late final BehaviorSubject<Command> _commandController = BehaviorSubject<Command>.seeded(NoCommand());
  Future<bool> get hasConnection => GetIt.I.get<NetworkInfo>().isConnected;

  Stream<Command> get commandStream => _commandController.stream;

  set command(Command s) => _commandController.add(s);



  @mustCallSuper
  void dispose() {
    _commandController.close();
    //_commandSubscription.cancel();
  }
}
