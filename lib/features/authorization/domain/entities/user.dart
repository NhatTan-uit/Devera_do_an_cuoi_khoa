import 'package:equatable/equatable.dart';

class UserEntities extends Equatable {
  final String? userId;
  final String? userName;
  final String? firstName;
  final String? lastName;
  final String userEmail;
  final String passWord;
  final String? userImg;
  final String? phoneNumber;

  const UserEntities({
    this.userId,
    this.userName,
    this.firstName,
    this.lastName,
    required this.userEmail,
    required this.passWord,
    this.userImg,
    this.phoneNumber
  });

  @override
  List<Object?> get props => [
    userId,
    userName,
    firstName,
    lastName,
    userEmail,
    passWord,
    userImg,
    phoneNumber
  ];
}