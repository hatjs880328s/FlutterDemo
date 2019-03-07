import 'package:json_annotation/json_annotation.dart';

part 'MoveCarModel.g.dart';

@JsonSerializable()

class MoveCarModel {

  MoveCarModel(this.accessToken,this.refreshToken,this.keepAlive,this.tokenType,this.openId,this.expiresIn);

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

  factory MoveCarModel.fromJson(Map<String, dynamic> json) => _$MoveCarModelFromJson(json);

  Map<String, dynamic> toJson() => _$MoveCarModelToJson(this);
}