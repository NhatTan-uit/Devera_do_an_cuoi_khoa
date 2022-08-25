import '../../domain/entities/cache_user.dart';

class CacheUserModel extends CacheUserEntities {
  const CacheUserModel({
    String? userId,
    String? userName,
    required String userEmail,
    required String passWord,
    String? userImg})
      : super(userId: userId, userName: userName, userEmail: userEmail, passWord: passWord, userImg: userImg);

  factory CacheUserModel.fromJson(Map<String, dynamic> json) {
    return CacheUserModel(
      userId: json["userId"],
      userName: json["userName"],
      userEmail: json["userEmail"],
      passWord: json["passWord"],
      userImg: json['userImg'],
    );
  }
}