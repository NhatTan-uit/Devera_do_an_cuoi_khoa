part of 'email_register_bloc.dart';

@immutable
abstract class EmailRegisterState extends Equatable{
  const EmailRegisterState();

  @override
  List<Object> get props => [];
}

class EmailRegisterInitial extends EmailRegisterState {}

class SignUpLoading extends EmailRegisterState {}

class SignUpCompleted extends EmailRegisterState {}

class SignUpVerifyEmailSent extends EmailRegisterState {}

class SignUpVerifyHasNotSent extends EmailRegisterState {}

class SignUpFailed extends EmailRegisterState {
  final String message;

  const SignUpFailed({required this.message});

  @override
  List<Object> get props => [message];
}
