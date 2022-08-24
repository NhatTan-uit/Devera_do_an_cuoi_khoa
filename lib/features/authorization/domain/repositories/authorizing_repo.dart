import 'package:dartz/dartz.dart';
import '../entities/user.dart';


abstract class AuthorizingRepository {
  Future<bool> emailAndPasswordLogIn(UserEntities userEntities);
  Future<Either<String, UserEntities>> getAuthorizedUser();
  Future<bool> pushUserToCache(UserEntities userEntities);
  Future<bool> emailAndPasswordCheckLoginStatus();
}
