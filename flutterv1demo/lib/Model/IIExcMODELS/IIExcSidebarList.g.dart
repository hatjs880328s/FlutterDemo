// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'IIExcSidebarList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IIExcSidebarList _$IIExcSidebarListFromJson(Map<String, dynamic> json) {
  return IIExcSidebarList()
    ..folderId = json['folderId'] as String
    ..totalCount = json['totalCount'] as int
    ..unreadCount = json['unreadCount'] as int
    ..folderClass = json['folderClass'] as String
    ..displayName = json['displayName'] as String
    ..childFolderCount = json['childFolderCount'] as int
    ..parentFolderId = json['parentFolderId'] as String
    ..folderType = json['folderType'] as int;
}

Map<String, dynamic> _$IIExcSidebarListToJson(IIExcSidebarList instance) =>
    <String, dynamic>{
      'folderId': instance.folderId,
      'totalCount': instance.totalCount,
      'unreadCount': instance.unreadCount,
      'folderClass': instance.folderClass,
      'displayName': instance.displayName,
      'childFolderCount': instance.childFolderCount,
      'parentFolderId': instance.parentFolderId,
      'folderType': instance.folderType
    };
