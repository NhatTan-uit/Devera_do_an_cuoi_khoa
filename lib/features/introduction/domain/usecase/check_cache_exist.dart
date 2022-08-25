import 'package:dartz/dartz.dart';

import '../entities/cache_user.dart';

import '../repositories/check_cache_user_repo.dart';

class CheckCacheUserUseCase {
  final CheckCacheUserRepository checkCacheUserRepository;

  CheckCacheUserUseCase(this.checkCacheUserRepository);


  Future<Either<String, CacheUserEntities>> getUserFromCache() async {
    return await checkCacheUserRepository.getAuthorizedUserFromCache();
  }

  Future pushNotFirstTime() async {
    await checkCacheUserRepository.pushNotFirstTime();
  }

  Future<bool> checkIfFirstTime() async {
    return await checkCacheUserRepository.checkIfFirstTime();
  }
}