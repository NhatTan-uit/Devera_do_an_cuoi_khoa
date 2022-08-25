import 'package:equatable/equatable.dart';

class CacheUserEntities extends Equatable {
  final String? userId;
  final String? userName;
  final String userEmail;
  final String passWord;
  final String? userImg;

  const CacheUserEntities({this.userId, this.userName, required this.userEmail, required this.passWord, this.userImg});

  @override
  List<Object?> get props => [userId, userName, userEmail, passWord, userImg];
}