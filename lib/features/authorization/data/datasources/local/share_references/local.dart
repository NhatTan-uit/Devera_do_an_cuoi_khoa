import 'package:dartz/dartz.dart';
import 'package:devera_do_an_cuoi_khoa/core/error/exception.dart';
import '../../../models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

const CACHED_LOGGED_USER= "CACHED_LOGGED_USER";

abstract class UserLocalDataSource {
  Future<Either<String, UserModel>> getCached();

  Future<Unit> pushCache(UserModel userModel);

  Future<Unit> removeUserCache();
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final SharedPreferences sharedPreferences;

  const UserLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<Either<String, UserModel>> getCached() async {
    final jsonString = sharedPreferences.getString(CACHED_LOGGED_USER);

    if (jsonString != null) {
      var decodeJsonData = json.decode(jsonString);

      UserModel loggedUser = UserModel.fromJson(decodeJsonData);

      return Right(loggedUser);
    }

    return Left("Non cache");
  }

  @override
  Future<Unit> pushCache(UserModel userModel) async {
    var userModelToJson = userModel.toJson();

    await sharedPreferences.setString(CACHED_LOGGED_USER, json.encode(userModelToJson));

    return Future.value(unit);
  }

  @override
  Future<Unit> removeUserCache() async {
    await sharedPreferences.remove('CACHED_LOGGED_USER');

    return Future.value(unit);
  }
}