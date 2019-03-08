import 'package:json_annotation/json_annotation.dart';

part 'MoveCarModel.g.dart';

@JsonSerializable()

class MoveCarModel {

  MoveCarModel(this.province,this.char);

  String province = "";

  List<String> char = [];

  factory MoveCarModel.fromJson(Map<String, dynamic> json) => _$MoveCarModelFromJson(json);

  Map<String, dynamic> toJson() => _$MoveCarModelToJson(this);
}