// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MoveCarModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoveCarModel _$MoveCarModelFromJson(Map<String, dynamic> json) {
  return MoveCarModel(json['province'] as String,
      (json['char'] as List)?.map((e) => e as String)?.toList());
}

Map<String, dynamic> _$MoveCarModelToJson(MoveCarModel instance) =>
    <String, dynamic>{'province': instance.province, 'char': instance.char};
