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

class AuthorizingError extends EmailAuthorizeState {
  final String message;

  const AuthorizingError({required this.message});

  @override
  List<Object> get props => [message];
}

class EmailHasNotVerified extends EmailAuthorizeState {
  final String message;

  const EmailHasNotVerified({required this.message});

  @override
  List<Object> get props => [message];
}

class LoadingUser extends EmailAuthorizeState {}