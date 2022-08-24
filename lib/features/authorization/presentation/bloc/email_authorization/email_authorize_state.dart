part of 'email_authorize_bloc.dart';

@immutable
abstract class EmailAuthorizeState extends Equatable{
  const EmailAuthorizeState();

  @override
  List<Object> get props => [];
}

class EmailAuthorizeInitial extends EmailAuthorizeState {}

class AuthenticationAuthenticated extends EmailAuthorizeState {
  final String message;
  final UserEntities userEntities;

  const AuthenticationAuthenticated({required this.message, required this.userEntities});

  @override
  List<Object> get props => [message, userEntities];
}

class AuthenticationUnauthenticated extends EmailAuthorizeState {
  final String message;

  const AuthenticationUnauthenticated({required this.message});

  @override
  List<Object> get props => [message];
}

class LoggedUser extends EmailAuthorizeState {
  final UserEntities userEntities;

  const LoggedUser({required this.userEntities});

  @override
  List<Object> get props => [userEntities];
}

class FailCacheUser extends EmailAuthorizeState {
  final String message;

  const FailCacheUser({required this.message});

  @override
  List<Object> get props => [message];
}

class UnLoggedUser extends EmailAuthorizeState {}

class LoadingUser extends EmailAuthorizeState {}

