import 'package:dartz/dartz.dart';
import 'package:devera_do_an_cuoi_khoa/features/introduction/data/datasources/local/share_references/local.dart';
import 'package:devera_do_an_cuoi_khoa/features/introduction/data/models/cache_user_model.dart';

import '../../domain/repositories/check_cache_user_repo.dart';

class CheckCacheUserRepoImpl implements CheckCacheUserRepository {
  final CheckUserLocalDataSource checkUserLocalDataSource;

  CheckCacheUserRepoImpl({required this.checkUserLocalDataSource});

  @override
  Future<Either<String, CacheUserModel>> getAuthorizedUserFromCache() async {
    final bool isCacheExist = await checkUserLocalDataSource.checkCached();

    if (!isCacheExist) {
      return Left("Unexpected Error");
    }
    else {
      return Right(await checkUserLocalDataSource.getCached());
    }
  }

  @override
  Future pushNotFirstTime() async {
    await checkUserLocalDataSource.pushNotFirstTime();
  }

  @override
  Future<bool> checkIfFirstTime() async {
    return await checkUserLocalDataSource.checkIfFirstTime();
  }

}