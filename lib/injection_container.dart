import 'package:devera_do_an_cuoi_khoa/features/authorization/data/datasources/local/db/firebase_config.dart';
import 'package:devera_do_an_cuoi_khoa/features/authorization/data/datasources/local/share_references/local.dart';
import 'package:devera_do_an_cuoi_khoa/features/authorization/data/repositories/authorizing_repositories_impl.dart';
import 'package:devera_do_an_cuoi_khoa/features/authorization/domain/repositories/authorizing_repo.dart';
import 'package:devera_do_an_cuoi_khoa/features/authorization/domain/usecase/email_password_authorizing.dart';
import 'package:get_it/get_it.dart';
import 'features/authorization/presentation/bloc/email_authorization/email_authorize_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final s1 = GetIt.instance;

Future<void> init() async {
  //Features - authorize

  //bloc
  s1.registerFactory(() => EmailAuthorizeBloc(
      emailAndPassWordAuthorizeUseCase: s1()));

  //usecases
  s1.registerLazySingleton(() => EmailAndPassWordAuthorizeUseCase(s1()));

  //repository
  s1.registerLazySingleton<AuthorizingRepository>(() => AuthorizingRepoImpl(
      firebaseConfig: s1(), userLocalDataSource: s1()
  ));

  //datasource
  s1.registerLazySingleton<FirebaseConfig>(() => FirebaseConfigImpl());
  s1.registerLazySingleton<UserLocalDataSource>(() => UserLocalDataSourceImpl(
      sharedPreferences: s1()
  ));

  //external
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  s1.registerLazySingleton(() => sharedPreferences);
}