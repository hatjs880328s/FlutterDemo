import 'package:json_annotation/json_annotation.dart';

part 'IIExcMainListModel.g.dart';

@JsonSerializable()

class IIExcMainListModel {

  IIExcMainListModel();
  String id;
  // 主题
  String subject;
  // 发件人
  String displaySender;
  // 发送给
  String displayTo;
  // 是否已读
  bool isRead;
  // 是否有附件
  bool hasAttachments;
  // 是否加密
  bool isEncrypted;
  // 是否加签
  bool isSigned;
  // size
  int size;
  // 发送事件
  String creationDate;
  // timestemp
  double creationTimestamp;


  factory IIExcMainListModel.fromJson(Map<String,dynamic> json) => _$IIExcMainListModelFromJson(json);  

  Map<String, dynamic> toJson() => _$IIExcMainListModelToJson(this);
}