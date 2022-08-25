import 'package:dartz/dartz.dart';
import '../../../models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

const CACHED_LOGGED_USER= "CACHED_LOGGED_USER";

abstract class UserLocalDataSource {
  Future<Unit> pushCache(UserModel userModel);

  Future<Unit> removeUserCache();
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final SharedPreferences sharedPreferences;

  const UserLocalDataSourceImpl({required this.sharedPreferences});

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