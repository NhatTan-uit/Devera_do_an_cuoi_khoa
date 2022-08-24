import '../../domain/entities/user.dart';

class UserModel extends UserEntities {
  const UserModel({
    String? userId,
    String? userName,
    required String userEmail,
    required String passWord,
    String? userImg})
      : super(userId: userId, userName: userName, userEmail: userEmail, passWord: passWord, userImg: userImg);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json["userId"],
      userName: json["userName"],
      userEmail: json["userEmail"],
      passWord: json["passWord"],
      userImg: json['userImg'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "userName": userName,
      "userEmail": userEmail,
      "passWord": passWord,
      "userImg": userImg,
    };
  }
}