import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../../application/application.dart';
import 'auth.dart';

@injectable
class AuthBloc extends BaseBloc<AuthState> {
  final LoginUser loginUser;
  final RegisterUser registerUser;

  AuthBloc(this.loginUser, this.registerUser) : super(const AuthState());

  void login({required String userName, required String password}) async {
    command = ShowLoadingCommand();

    final either = await loginUser.execute(LoginUserParams(username: userName, password: password));

    either.fold((l) {
      command = DismissLoadingCommand();
      command = ErrorDialogCommand(l.errorMessage);
    }, (r) {
      command = DismissLoadingCommand();
      command = NavigationCommand('/home');
    });
  }

  void register({required String userName, required String password}) async {
    command = ShowLoadingCommand();

    final either = await registerUser.execute(RegisterUserParams(username: userName, password: password));

    either.fold((l) {
      command = DismissLoadingCommand();
      command = ErrorDialogCommand(l.errorMessage);
    }, (r) {
      command = DismissLoadingCommand();
      command = NavigationCommand('/home');
    });
  }
}
