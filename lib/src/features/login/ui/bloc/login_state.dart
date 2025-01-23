import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String message;

  LoginSuccess({required this.message});

  @override
  List<Object?> get props => [message];
}

class LoginError extends LoginState {
  final String message;

  LoginError({required this.message});

  @override
  List<Object?> get props => [message];
}
