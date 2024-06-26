import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/core.dart';
import '../../data/data.dart';
import '../domain.dart';

import 'package:dartz/dartz.dart';

import '../../../core/core.dart';
import '../../domain/domain.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> login(String username, String password);
  Future<Either<Failure, UserEntity>> register(String username, String password);

  Future<Either<Failure, UserEntity>> getMe();
}
