part of 'email_user_profile_bloc.dart';

@immutable
abstract class EmailUserProfileState extends Equatable {
  const EmailUserProfileState();

  @override
  List<Object> get props => [];
}

class EmailUserProfileInitial extends EmailUserProfileState {}

class LoadingUploadData extends EmailUserProfileState {}

class UserProfileUploadCompleted extends EmailUserProfileState {
  final String userImg;
  final UserEntities userEntities;

  UserProfileUploadCompleted({required this.userEntities, required this.userImg});

  @override
  List<Object> get props => [];
}