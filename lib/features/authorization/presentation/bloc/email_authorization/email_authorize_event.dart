part of 'email_authorize_bloc.dart';

@immutable
abstract class EmailAuthorizeEvent extends Equatable{
  const EmailAuthorizeEvent();

  @override
  List<Object> get  props => [];
}

class LoginEvent extends EmailAuthorizeEvent {
  final UserEntities userEntities;

  const LoginEvent({required this.userEntities});

  @override
  List<Object> get props => [userEntities];
}

class LogoutEvent extends EmailAuthorizeEvent {}


