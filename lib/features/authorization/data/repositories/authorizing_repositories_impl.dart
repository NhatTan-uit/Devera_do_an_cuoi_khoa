import 'package:devera_do_an_cuoi_khoa/features/authorization/data/datasources/local/db/firebase_config.dart';
import 'package:devera_do_an_cuoi_khoa/features/authorization/data/datasources/local/share_references/local.dart';
import 'package:devera_do_an_cuoi_khoa/features/authorization/data/models/user_model.dart';
import 'package:devera_do_an_cuoi_khoa/features/authorization/domain/entities/user.dart';

import '../../domain/repositories/authorizing_repo.dart';

class AuthorizingRepoImpl implements AuthorizingRepository {
  final FirebaseConfig firebaseConfig;
  final UserLocalDataSource userLocalDataSource;

  AuthorizingRepoImpl({required this.firebaseConfig, required this.userLocalDataSource});

  @override
  Future emailAndPasswordLogIn(UserEntities userEntities) async {
    final UserModel userModel = UserModel(
        userEmail: userEntities.userEmail,
        passWord: userEntities.passWord
    );

    await firebaseConfig.emailAndPasswordLogIn(userModel);
  }

  @override
  Future<bool> emailAndPasswordCheckLoginStatus() async {
    return await firebaseConfig.emailAndPasswordCheckLoginStatus();
  }

  @override
  Future<UserModel> getAuthorizedUser() async {
      return await firebaseConfig.getAuthorizedUser();
  }

  @override
  Future pushUserToCache(UserEntities userEntities) async {

    UserModel userModel = UserModel(
        userId: userEntities.userId,
        userEmail: userEntities.userEmail,
        passWord: userEntities.passWord,
        userImg: "Hello From Me!!!"
    );

    userLocalDataSource.pushCache(userModel);
  }

  @override
  Future<bool> emailAndPasswordLogout() async {
    await firebaseConfig.emailAndPasswordLogOut();

    await userLocalDataSource.removeUserCache();

    return true;
  }

  @override
  Future<String> emailAndPasswordSignUp(UserEntities userEntities) async {
    final UserModel userModel = UserModel(
        userEmail: userEntities.userEmail,
        passWord: userEntities.passWord
    );

    return await firebaseConfig.emailAndPasswordSignUp(userModel);
  }

  @override
  Future<bool> emailAndPasswordSignUpVerifyEmail() async {
    return await firebaseConfig.emailAndPasswordSignUpVerifyEmail();
  }

  @override
  Future<bool> isEmailVerified() async {
    return await firebaseConfig.isEmailVerified();
  }
}