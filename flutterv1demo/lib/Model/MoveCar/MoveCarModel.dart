import 'package:json_annotation/json_annotation.dart';
import 'package:flutterv1demo/Model/MoveCar/MoveCarSmallModel.dart';

part 'MoveCarModel.g.dart';

@JsonSerializable()

class MoveCarModel {

  MoveCarModel(this.id,this.carOwner, this.ownerPhone, this.carBrand, this.finalCharge);

  /// 车辆拍照model
  MoveCarSmallModel id = MoveCarSmallModel("","","");

  /// 拥有者
  String carOwner = "";

  /// 主人电话
  String ownerPhone = "";

  /// 车型号
  String carBrand = "";

  /// 颜色
  String carColor = "";

  /// 未知属性？
  double finalCharge = 0.0;

  factory MoveCarModel.fromJson(Map<String, dynamic> json) => _$MoveCarModelFromJson(json);

  Map<String, dynamic> toJson() => _$MoveCarModelToJson(this);
}