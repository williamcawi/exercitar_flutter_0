import 'package:equatable/equatable.dart';

class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginUserEvent extends LoginEvent {
  final String usernameOrEmail;
  final String password;

  LoginUserEvent({required this.usernameOrEmail, required this.password});
}
