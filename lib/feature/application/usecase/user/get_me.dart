import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_arch/core/core.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/domain.dart';

@injectable
class GetMe extends UseCase<UserEntity, NoParams> {
  final UserRepository _userRepository;

  GetMe(this._userRepository);

  @override
  Future<Either<Failure, UserEntity>> execute(NoParams params) {
    return _userRepository.getMe();
  }
}