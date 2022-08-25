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
}
