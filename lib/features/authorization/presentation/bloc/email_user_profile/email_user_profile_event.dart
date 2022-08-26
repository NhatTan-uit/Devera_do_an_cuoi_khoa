part of 'email_user_profile_bloc.dart';

@immutable
abstract class EmailUserProfileEvent  extends Equatable {
  const EmailUserProfileEvent();

  @override
  List<Object> get  props => [];
}

class UserProfileToWebServiceWithImg extends EmailUserProfileEvent {
  final PlatformFile pickedFile;
  final UserEntities userEntities;

  const UserProfileToWebServiceWithImg({required this.pickedFile, required this.userEntities});

  @override
  List<Object> get props => [pickedFile, userEntities];
}

class UserProfileToWebServiceDefaultImg extends EmailUserProfileEvent {
  final UserEntities userEntities;

  const UserProfileToWebServiceDefaultImg({required this.userEntities});

  @override
  List<Object> get props => [userEntities];
}

