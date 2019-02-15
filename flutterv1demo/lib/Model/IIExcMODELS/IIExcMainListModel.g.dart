// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'IIExcMainListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IIExcMainListModel _$IIExcMainListModelFromJson(Map<String, dynamic> json) {
  return IIExcMainListModel()
    ..id = json['id'] as String
    ..subject = json['subject'] as String
    ..displaySender = json['displaySender'] as String
    ..displayTo = json['displayTo'] as String
    ..isRead = json['isRead'] as bool
    ..hasAttachments = json['hasAttachments'] as bool
    ..isEncrypted = json['isEncrypted'] as bool
    ..isSigned = json['isSigned'] as bool
    ..size = json['size'] as int
    ..creationDate = json['creationDate'] as String
    ..creationTimestamp = (json['creationTimestamp'] as num)?.toDouble();
}

Map<String, dynamic> _$IIExcMainListModelToJson(IIExcMainListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subject': instance.subject,
      'displaySender': instance.displaySender,
      'displayTo': instance.displayTo,
      'isRead': instance.isRead,
      'hasAttachments': instance.hasAttachments,
      'isEncrypted': instance.isEncrypted,
      'isSigned': instance.isSigned,
      'size': instance.size,
      'creationDate': instance.creationDate,
      'creationTimestamp': instance.creationTimestamp
    };
