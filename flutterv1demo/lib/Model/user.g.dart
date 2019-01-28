// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(json['name'] as String, json['id'] as String,
      json['registration_date_millis'] as int);
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'registration_date_millis': instance.registrationDateMillis,
      'name': instance.name,
      'id': instance.id
    };
