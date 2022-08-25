import 'package:dartz/dartz.dart';
import '../entities/cache_user.dart';


abstract class CheckCacheUserRepository {
  Future<Either<String, CacheUserEntities>> getAuthorizedUserFromCache();
  Future pushNotFirstTime();
  Future<bool> checkIfFirstTime();
}
