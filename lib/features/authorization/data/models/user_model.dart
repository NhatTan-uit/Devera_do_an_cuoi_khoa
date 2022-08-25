import '../../domain/entities/user.dart';

class UserModel extends UserEntities {
  const UserModel({
    String? userId,
    String? userName,
    String? firstName,
    String? lastName,
    required String userEmail,
    required String passWord,
    String? userImg,
    String? phoneNumber
  })
      : super(
      userId: userId,
      firstName: firstName,
      lastName: lastName,
      userName: userName,
      userEmail: userEmail,
      passWord: passWord,
      userImg: userImg,
      phoneNumber: phoneNumber,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json["userId"] as String,
      userName: json["userName"] as String,
      firstName: json["firstName"] as String,
      lastName: json["lastName"] as String,
      userEmail: json["userEmail"] as String,
      passWord: "",
      userImg: json['userImg'] as String,
      phoneNumber: json["phoneNumber"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "userName": userName,
      "firstName": firstName,
      "lastName": lastName,
      "userEmail": userEmail,
      "passWord": passWord,
      "userImg": userImg,
      "phoneNumber": phoneNumber,
    };
  }
}