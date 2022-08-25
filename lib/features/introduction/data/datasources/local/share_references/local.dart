
import '../../../models/cache_user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

const CACHED_LOGGED_USER= "CACHED_LOGGED_USER";
const CACHED_CHECK_FIRST_TIME= "CACHED_CHECK_FIRST_TIME";

abstract class CheckUserLocalDataSource {
  Future<bool> checkCached();
  Future<CacheUserModel> getCached();
  Future pushNotFirstTime();
  Future<bool> checkIfFirstTime();
}

class CheckUserLocalDataSourceImpl implements CheckUserLocalDataSource {
  final SharedPreferences sharedPreferences;

  const CheckUserLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<CacheUserModel> getCached() async {
    final jsonString = sharedPreferences.getString(CACHED_LOGGED_USER);

    if (jsonString != null) {
      var decodeJsonData = json.decode(jsonString);

      CacheUserModel loggedUser = CacheUserModel.fromJson(decodeJsonData);

      return loggedUser;
    }

    return throw Exception();
  }

  @override
  Future<bool> checkCached() async {
    final jsonString = sharedPreferences.getString(CACHED_LOGGED_USER);

    if (jsonString != null) {
      return true;
    }

    return false;
  }

  @override
  Future pushNotFirstTime() async {
    await sharedPreferences.setString(CACHED_CHECK_FIRST_TIME, "not first time");
  }

  @override
  Future<bool> checkIfFirstTime() async {
    final isFirstTime = sharedPreferences.getString(CACHED_CHECK_FIRST_TIME);

    if (isFirstTime == null) {
      return true;
    }

    return false;
  }
}