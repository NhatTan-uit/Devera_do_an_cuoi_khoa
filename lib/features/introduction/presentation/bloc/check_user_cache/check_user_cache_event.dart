part of 'check_user_cache_bloc.dart';

@immutable
abstract class CheckUserCacheEvent extends Equatable {
  const CheckUserCacheEvent();

  @override
  List<Object> get  props => [];
}

class CheckUserLoggedInEvent extends CheckUserCacheEvent {}
