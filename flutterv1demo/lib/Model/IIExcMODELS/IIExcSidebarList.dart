
import 'package:json_annotation/json_annotation.dart';

part 'IIExcSidebarList.g.dart';

@JsonSerializable()

/// 侧拉列表的model
class IIExcSidebarList {

  IIExcSidebarList();

  // 邮件id
  String folderId;
  // 总个数
  int totalCount;
  // 未读个数
  int unreadCount;
  // 文件夹class
  String folderClass;
  // 显示名字
  String displayName;
  // 孩子个数
  int childFolderCount;
  // 父亲id
  String parentFolderId;
  // 文件夹类型
  int folderType;

  factory IIExcSidebarList.fromJson(Map<String, dynamic> json) => _$IIExcSidebarListFromJson(json);
  Map<String, dynamic> toJson() => _$IIExcSidebarListToJson(this);
}