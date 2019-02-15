// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'IIExcFolderModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IIExcFolderModel _$IIExcFolderModelFromJson(Map<String, dynamic> json) {
  return IIExcFolderModel()
    ..id = json['id'] as String
    ..totalCount = json['totalCount'] as int
    ..unreadCount = json['unreadCount'] as int
    ..folderClass = json['folderClass'] as String
    ..displayName = json['displayName'] as String
    ..childFolderCount = json['childFolderCount'] as int
    ..order = json['order'] as int
    ..folderType = json['folderType'] as int;
}

Map<String, dynamic> _$IIExcFolderModelToJson(IIExcFolderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'totalCount': instance.totalCount,
      'unreadCount': instance.unreadCount,
      'folderClass': instance.folderClass,
      'displayName': instance.displayName,
      'childFolderCount': instance.childFolderCount,
      'order': instance.order,
      'folderType': instance.folderType
    };
