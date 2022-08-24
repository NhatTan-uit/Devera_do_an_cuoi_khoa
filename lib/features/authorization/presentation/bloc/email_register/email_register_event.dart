part of 'email_register_bloc.dart';

@immutable
abstract class EmailRegisterEvent extends Equatable{
  const EmailRegisterEvent();

  @override
  List<Object> get  props => [];
}

class SignUpEvent extends EmailRegisterEvent {
  final UserEntities userEntities;

  const SignUpEvent({required this.userEntities});

  @override
  List<Object> get props => [userEntities];
}

class ResendEvent extends EmailRegisterEvent {}
