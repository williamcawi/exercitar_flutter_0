import 'package:equatable/equatable.dart';

class SignUpState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final String message;

  SignUpSuccess({required this.message});

  @override
  List<Object?> get props => [message];
}

class SignUpError extends SignUpState {
  final String message;

  SignUpError({required this.message});

  @override
  List<Object?> get props => [message];
}
