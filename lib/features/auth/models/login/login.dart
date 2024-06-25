
import 'package:json_annotation/json_annotation.dart';
import 'package:mytodo_mobx_app/features/auth/models/login/data_login.dart';

part 'login.g.dart';

@JsonSerializable()
class Login {
  String? token;
  DataLogin? data;

  Login({this.token, this.data});

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);
  Map<String, dynamic> toJson() => _$LoginToJson(this);
}