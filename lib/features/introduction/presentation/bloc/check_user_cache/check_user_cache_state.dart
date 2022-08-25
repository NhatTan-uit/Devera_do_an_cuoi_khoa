part of 'check_user_cache_bloc.dart';

@immutable
abstract class CheckUserCacheState extends Equatable {
  const CheckUserCacheState();

  @override
  List<Object> get  props => [];
}

class CheckUserCacheInitial extends CheckUserCacheState {}

class Processing extends CheckUserCacheState {}

class UserCached extends CheckUserCacheState {
  final String message;
  final CacheUserEntities checkUserEntities;

  const UserCached({required this.message, required this.checkUserEntities});

  @override
  List<Object> get props => [message, checkUserEntities];
}

class UserUnCached extends CheckUserCacheState {
  final String message;

  const UserUnCached({required this.message});

  @override

  @override
  List<Object> get props => [message];
}

class UserFirstTimeToApp extends CheckUserCacheState {}

class UserBeenToApp extends CheckUserCacheState {}