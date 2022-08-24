import 'package:dartz/dartz.dart';

import '../entities/user.dart';

import '../repositories/authorizing_repo.dart';

class EmailAndPassWordAuthorizeUseCase {
  final AuthorizingRepository authorizingRepository;

  EmailAndPassWordAuthorizeUseCase(this.authorizingRepository);

  Future<bool> call(UserEntities userEntities) async {
    return await authorizingRepository.emailAndPasswordLogIn(userEntities);
  }

  Future<Either<String, UserEntities>> getUser() async {
    return await authorizingRepository.getAuthorizedUser();
  }

  Future<bool> emailAndPasswordCheckLoginStatus() async {
    return await authorizingRepository.emailAndPasswordCheckLoginStatus();
  }

  Future<bool> pushUserToCache(UserEntities userEntities) async {
    return await authorizingRepository.pushUserToCache(userEntities);
  }
}