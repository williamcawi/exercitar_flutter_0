import 'package:equatable/equatable.dart';

class SignUpEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignUpUserEvent extends SignUpEvent {
  final String username;
  final String email;
  final String password;

  SignUpUserEvent(
      {required this.username, required this.email, required this.password});

  @override
  List<Object?> get props => [username, email, password];
}
