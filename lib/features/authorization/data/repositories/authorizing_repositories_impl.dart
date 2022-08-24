import 'package:dartz/dartz.dart';
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
  Future<bool> emailAndPasswordLogIn(UserEntities userEntities) async {
    final UserModel userModel = UserModel(
        userEmail: userEntities.userEmail,
        passWord: userEntities.passWord
    );

    bool loginStatus = await firebaseConfig.emailAndPasswordLogIn(userModel);

    return loginStatus;
  }

  @override
  Future<bool> emailAndPasswordCheckLoginStatus() async {
    return await firebaseConfig.emailAndPasswordCheckLoginStatus();
  }

  @override
  Future<Either<String, UserModel>> getAuthorizedUser() async {
    UserModel cacheUserModel = await userLocalDataSource.getCached();

    if (cacheUserModel == null) {
      return Left("Unexpected Error");
    }
    else {
      return Right(await firebaseConfig.getAuthorizedUser());
    }
  }

  @override
  Future<bool> pushUserToCache(UserEntities userEntities) async {
    bool isPush = true;

    final UserModel userModel = UserModel(
        userEmail: userEntities.userEmail,
        passWord: userEntities.passWord
    );

    userLocalDataSource.pushCache(userModel);

    return isPush;
  }
}