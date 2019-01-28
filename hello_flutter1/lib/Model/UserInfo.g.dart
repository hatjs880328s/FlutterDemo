// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) =>
    new UserInfo(json['name'] as String, json['id'] as String);

abstract class _$UserInfoSerializerMixin {
  String get name;
  String get id;
  Map<String, dynamic> toJson() => <String, dynamic>{'name': name, 'id': id};
}
