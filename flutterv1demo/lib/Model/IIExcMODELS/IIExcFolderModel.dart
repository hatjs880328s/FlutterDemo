import 'package:json_annotation/json_annotation.dart';

part 'IIExcFolderModel.g.dart';

@JsonSerializable()

class IIExcFolderModel {

  IIExcFolderModel();
  String id;
  int totalCount;
  int unreadCount;
  String folderClass;
  String displayName;
  int childFolderCount;
  int order;
  int folderType;

  factory IIExcFolderModel.fromJson(Map<String,dynamic> json) => _$IIExcFolderModelFromJson(json);  

  Map<String, dynamic> toJson() => _$IIExcFolderModelToJson(this);
}