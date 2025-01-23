import 'package:bloc/bloc.dart';
import 'package:exercitar_0/src/features/login/data/repository/login_repository.dart';
import 'package:exercitar_0/src/features/login/ui/bloc/login_event.dart';
import 'package:exercitar_0/src/features/login/ui/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository _repository;

  LoginBloc({required LoginRepository repository})
      : _repository = repository,
        super(LoginInitial()) {
    on<LoginUserEvent>(
      (event, emit) async {
        emit(LoginLoading());
        final failureOrSuccess = await _repository.login(
            usernameOrEmail: event.usernameOrEmail, password: event.password);
        failureOrSuccess.fold((message) {
          emit(LoginError(message: message));
        }, (message) {
          emit(LoginSuccess(message: message));
        });
      },
    );
  }
}
