import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/user_model.dart';

const authorizingApi = "http://192.168.158.177:4000";

abstract class UserRemoteDataSource {
  Future<UserModel> getCurrentUserFromApi(String userId);
  Future<bool> checkIfFirstTimeUserFromApi(String userId);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;

  UserRemoteDataSourceImpl({required this.client});

  @override
  Future<UserModel> getCurrentUserFromApi(String userId) async {
    final postId = json.encode({"userId": userId.toString()});

    final response = await client.post(
      Uri.parse("$authorizingApi/users/login"),
      headers: {"Content-Type": "application/json"},
      body: postId,
    );

    if (response.statusCode == 200) {
      final userFromApi = json.decode(response.body);

      UserModel userGot = UserModel.fromJson(userFromApi);

      return userGot;
    }

    return throw Exception();
  }

  @override
  Future<bool> checkIfFirstTimeUserFromApi(String userId) async {
    final postId = json.encode({"userId": userId.toString()});

    final response = await client.post(
      Uri.parse("$authorizingApi/users/login"),
      headers: {"Content-Type": "application/json"},
      body: postId,
    );

    if (response.statusCode == 200) {
      final userFromApi = json.decode(response.body);

      if (userFromApi.toString() == "Not register"){
        return true;
      }
      else {
        return false;
      }
    }

    return false;
  }
}