import 'package:dartz/dartz.dart';
import '../entities/user.dart';


abstract class AuthorizingRepository {
  Future<bool> isEmailVerified();

  Future<bool> emailAndPasswordLogIn(UserEntities userEntities);
  Future<Either<String, UserEntities>> getAuthorizedUser();
  Future<bool> pushUserToCache(UserEntities userEntities);
  Future<bool> emailAndPasswordCheckLoginStatus();
  Future<bool> emailAndPasswordLogout();

  Future<String> emailAndPasswordSignUp(UserEntities userEntities);
  Future<bool> emailAndPasswordSignUpVerifyEmail();
}
