// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LoginToken.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginToken _$LoginTokenFromJson(Map<String, dynamic> json) {
  return LoginToken(
      json['access_token'] as String,
      json['refresh_token'] as String,
      json['keep_alive'] as int,
      json['token_type'] as String,
      json['open_id'] as String,
      json['expires_in'] as int);
}

Map<String, dynamic> _$LoginTokenToJson(LoginToken instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'keep_alive': instance.keepAlive,
      'token_type': instance.tokenType,
      'open_id': instance.openId,
      'expires_in': instance.expiresIn
    };
