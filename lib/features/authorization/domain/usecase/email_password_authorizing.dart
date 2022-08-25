import '../entities/user.dart';

import '../repositories/authorizing_repo.dart';

class EmailAndPassWordAuthorizeUseCase {
  final AuthorizingRepository authorizingRepository;

  EmailAndPassWordAuthorizeUseCase(this.authorizingRepository);

  Future emailAndPasswordLogin(UserEntities userEntities) async {
    return await authorizingRepository.emailAndPasswordLogIn(userEntities);
  }

  Future<UserEntities> getUser() async {
    return await authorizingRepository.getAuthorizedUser();
  }

  Future<bool> emailAndPasswordCheckLoginStatus() async {
    return await authorizingRepository.emailAndPasswordCheckLoginStatus();
  }

  Future pushUserToCache(UserEntities userEntities) async {
    return await authorizingRepository.pushUserToCache(userEntities);
  }

  Future<bool> removeUserCache() async {
    return await authorizingRepository.emailAndPasswordLogout();
  }

  Future<String> signUp(UserEntities userEntities) async {
    return await authorizingRepository.emailAndPasswordSignUp(userEntities);
  }

  Future<bool> emailAndPasswordSignUpVerifyEmail() async {
    return await authorizingRepository.emailAndPasswordSignUpVerifyEmail();
  }

  Future<bool> isEmailVerified() async {
    return await authorizingRepository.isEmailVerified();
  }

  Future<UserEntities> getCurrentUserFromApi(String userId) async {
    return await authorizingRepository.getCurrentUserFromApi(userId);
  }

  Future<bool> checkIfFirstTimeUserFromApi(String userId) async {
    return await authorizingRepository.checkIfFirstTimeUserFromApi(userId);
  }
}