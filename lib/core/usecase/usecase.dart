import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../core.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> execute(Params params);
}

abstract class InstantUseCase<Type, Params> {
  Either<Failure, Type> execute(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}