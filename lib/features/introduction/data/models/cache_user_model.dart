import '../../domain/entities/cache_user.dart';

class CacheUserModel extends CacheUserEntities {
  const CacheUserModel({
    String? userId,
    String? userName,
    String? firstName,
    String? lastName,
    required String userEmail,
    String? userImg,
    String? phoneNumber,
  })
      : super(
    userId: userId,
    userName: userName,
    firstName: firstName,
    lastName: lastName,
    userEmail: userEmail,
    userImg: userImg,
    phoneNumber: phoneNumber,
  );

  factory CacheUserModel.fromJson(Map<String, dynamic> json) {
    return CacheUserModel(
      userId: json["userId"],
      userName: json["userName"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      userEmail: json["userEmail"],
      userImg: json['userImg'],
      phoneNumber: json["phoneNumber"],
    );
  }
}