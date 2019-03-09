import 'package:json_annotation/json_annotation.dart';

part 'MoveCarSmallModel.g.dart';

@JsonSerializable()

class MoveCarSmallModel {

  MoveCarSmallModel(this.province,this.city, this.number);

  // String province = "";

  // List<String> char = [];

  String province = "";

  String city = "";

  String number = "";

  factory MoveCarSmallModel.fromJson(Map<String, dynamic> json) => _$MoveCarSmallModelFromJson(json);

  Map<String, dynamic> toJson() => _$MoveCarSmallModelToJson(this);
}