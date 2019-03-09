// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MoveCarModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoveCarModel _$MoveCarModelFromJson(Map<String, dynamic> json) {
  return MoveCarModel(
      json['id'] == null
          ? null
          : MoveCarSmallModel.fromJson(json['id'] as Map<String, dynamic>),
      json['carOwner'] as String,
      json['ownerPhone'] as String,
      json['carBrand'] as String,
      (json['finalCharge'] as num)?.toDouble())
    ..carColor = json['carColor'] as String;
}

Map<String, dynamic> _$MoveCarModelToJson(MoveCarModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'carOwner': instance.carOwner,
      'ownerPhone': instance.ownerPhone,
      'carBrand': instance.carBrand,
      'carColor': instance.carColor,
      'finalCharge': instance.finalCharge
    };
