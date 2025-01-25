import 'package:exercitar_0/src/features/signUp/data/repository/sign_up_repository.dart';
import 'package:exercitar_0/src/features/signUp/ui/bloc/sign_up_event.dart';
import 'package:exercitar_0/src/features/signUp/ui/bloc/sign_up_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpRepository _repository;

  SignUpBloc({required SignUpRepository repository})
      : _repository = repository,
        super(SignUpInitial()) {
    on<SignUpUserEvent>(
      (event, emit) async {
        emit(SignUpLoading());
        final failureOrSuccess = await _repository.signUp(
            username: event.username,
            email: event.email,
            password: event.password);
        failureOrSuccess.fold((message) {
          emit(SignUpError(message: message));
        }, (message) {
          emit(SignUpSuccess(message: message));
        });
      },
    );
  }
}
