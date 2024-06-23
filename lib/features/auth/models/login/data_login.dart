

import 'package:json_annotation/json_annotation.dart';

part 'data_login.g.dart';

@JsonSerializable()
class DataLogin {
  String id;
  String fullName;
  String email;

  DataLogin({required this.id, required this.fullName, required this.email});

  factory DataLogin.fromJson(Map<String, dynamic> json) => _$DataLoginFromJson(json);
  Map<String, dynamic> toJson() => _$DataLoginToJson(this);
}