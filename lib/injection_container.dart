//authorization
import 'package:devera_do_an_cuoi_khoa/features/authorization/data/datasources/local/db/firebase_config.dart';
import 'package:devera_do_an_cuoi_khoa/features/authorization/data/datasources/local/share_references/local.dart';
import 'package:devera_do_an_cuoi_khoa/features/authorization/data/datasources/remote/remote.dart';
import 'package:devera_do_an_cuoi_khoa/features/authorization/data/repositories/authorizing_repositories_impl.dart';
import 'package:devera_do_an_cuoi_khoa/features/authorization/domain/repositories/authorizing_repo.dart';
import 'package:devera_do_an_cuoi_khoa/features/authorization/domain/usecase/email_password_authorizing.dart';
import 'package:devera_do_an_cuoi_khoa/features/authorization/presentation/bloc/email_register/email_register_bloc.dart';
import 'package:devera_do_an_cuoi_khoa/features/authorization/presentation/bloc/email_user_profile/email_user_profile_bloc.dart';
//introduction
import 'package:devera_do_an_cuoi_khoa/features/introduction/data/datasources/local/share_references/local.dart';
import 'package:devera_do_an_cuoi_khoa/features/introduction/data/repositories/check_cache_user_repo_iml.dart';
import 'package:devera_do_an_cuoi_khoa/features/introduction/domain/repositories/check_cache_user_repo.dart';
import 'package:devera_do_an_cuoi_khoa/features/introduction/domain/usecase/check_cache_exist.dart';
import 'package:devera_do_an_cuoi_khoa/features/introduction/presentation/bloc/check_user_cache/check_user_cache_bloc.dart';
import 'package:get_it/get_it.dart';
import 'features/authorization/presentation/bloc/email_authorization/email_authorize_bloc.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final s1 = GetIt.instance;

Future<void> init() async {
  //Features - introduction

  //bloc
  s1.registerFactory(() => CheckUserCacheBloc(
      checkCacheUserUseCase: s1()));

  //usecase
  s1.registerLazySingleton(() => CheckCacheUserUseCase(s1()));

  //repository
  s1.registerLazySingleton<CheckCacheUserRepository>(() => CheckCacheUserRepoImpl(
    checkUserLocalDataSource: s1(),
  ));

  //datasource
  s1.registerLazySingleton<CheckUserLocalDataSource>(() => CheckUserLocalDataSourceImpl(
      sharedPreferences: s1()));

  //Features - authorize

  //bloc
  s1.registerFactory(() => EmailAuthorizeBloc(
      emailAndPassWordAuthorizeUseCase: s1()));

  s1.registerFactory(() => EmailRegisterBloc(
      emailAndPassWordAuthorizeUseCase: s1()));

  s1.registerFactory(() => EmailUserProfileBloc(
      emailAndPassWordAuthorizeUseCase: s1()));

  //usecases
  s1.registerLazySingleton(() => EmailAndPassWordAuthorizeUseCase(s1()));

  //repository
  s1.registerLazySingleton<AuthorizingRepository>(() => AuthorizingRepoImpl(
      firebaseConfig: s1(), userLocalDataSource: s1(), userRemoteDataSource: s1()
  ));

  //datasource
  s1.registerLazySingleton<FirebaseConfig>(() => FirebaseConfigImpl());
  s1.registerLazySingleton<UserLocalDataSource>(() => UserLocalDataSourceImpl(
      sharedPreferences: s1()
  ));
  s1.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSourceImpl(
      client: s1()
  ));

  //external
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  s1.registerLazySingleton(() => sharedPreferences);
  s1.registerLazySingleton(() => http.Client());
}