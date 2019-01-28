import 'package:json_annotation/json_annotation.dart';

part 'UserInfo.g.dart';

@JsonSerializable()

class UserInfo {
  UserInfo(this.name, this.id);

  String name;

  String id;

  factory UserInfo.fromJson(Map<String, dynamic> json) => _$UserInfoFromJson(json);
  //Map<String, dynamic> toJson() =>   _$UserInfoSerializerMixin().toJson();

}

UserInfo hello = UserInfo("name", "id");





