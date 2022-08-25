import 'package:equatable/equatable.dart';

class CacheUserEntities extends Equatable {
  final String? userId;
  final String? userName;
  final String? firstName;
  final String? lastName;
  final String userEmail;
  final String? userImg;
  final String? phoneNumber;

  const CacheUserEntities({
    this.userId,
    this.userName,
    this.firstName,
    this.lastName,
    required this.userEmail,
    this.userImg,
    this.phoneNumber,
  });

  @override
  List<Object?> get props => [
    userId,
    userName,
    firstName,
    lastName,
    userEmail,
    userImg,
    phoneNumber,
  ];
}