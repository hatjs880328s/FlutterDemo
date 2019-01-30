import 'package:json_annotation/json_annotation.dart';

part 'LoginToken.g.dart';

@JsonSerializable()

class LoginToken {

  LoginToken(this.accessToken,this.refreshToken,this.keepAlive,this.tokenType,this.openId,this.expiresIn);

  @JsonKey(name: 'access_token')
  String accessToken;

  @JsonKey(name: 'refresh_token')
  String refreshToken;

  @JsonKey(name: 'keep_alive')
  int keepAlive;

  @JsonKey(name: 'token_type')
  String tokenType;

  @JsonKey(name: 'open_id')
  String openId;

  @JsonKey(name: 'expires_in')
  int expiresIn;

  factory LoginToken.fromJson(Map<String, dynamic> json) => _$LoginTokenFromJson(json);
  Map<String, dynamic> toJson() => _$LoginTokenToJson(this);
}