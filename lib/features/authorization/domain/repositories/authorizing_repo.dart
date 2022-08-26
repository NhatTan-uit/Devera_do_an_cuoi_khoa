import 'package:file_picker/file_picker.dart';

import '../entities/user.dart';



abstract class AuthorizingRepository {
  Future<bool> isEmailVerified();

  Future emailAndPasswordLogIn(UserEntities userEntities);
  Future<UserEntities> getAuthorizedUser();
  Future pushUserToCache(UserEntities userEntities);
  Future<bool> emailAndPasswordCheckLoginStatus();
  Future<bool> emailAndPasswordLogout();

  Future<String> emailAndPasswordSignUp(UserEntities userEntities);
  Future<bool> emailAndPasswordSignUpVerifyEmail();

  Future<UserEntities> getCurrentUserFromApi(String userId);

  Future<bool> checkIfFirstTimeUserFromApi(String userId);

  Future registerUserImage(PlatformFile pickedfile);

  Future postUserProfileToApi(UserEntities UserEntities);

  Future<String> getImage(String userImg);
}
