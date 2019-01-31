import 'package:json_annotation/json_annotation.dart';

part 'IIExcMainListModel.g.dart';

@JsonSerializable()

class IIExcMainListModel {

  IIExcMainListModel();
  String name;
  String displayName;

  factory IIExcMainListModel.fromJson(Map<String,dynamic> json) => _$IIExcMainListModelFromJson(json);  

  Map<String, dynamic> toJson() => _$IIExcMainListModelToJson(this);
}