import 'package:flutterv1demo/Utility/IIHTTP/IIHTTPRequestUti.dart';
import 'package:flutterv1demo/Utility/IIHTTP/IIHTTPRequestEnum.dart';
import 'package:flutterv1demo/Utility/IIHTTP/IIHTTPStaticInfos.dart';
import 'package:flutterv1demo/Model/MoveCar/MoveCarModel.dart';

/// 挪车 - bll
class MoveCarBll {

  /// 获取当前省以及下面的市信息
  Future<List<dynamic>> getProvinces() async {
    List<dynamic> infos = await IIHTTPRequestUti().request(IIHTTPRequestEnum.gEt, null, IIHTTPStaticInfos.moveCarProvince);
    return infos;
  }

  /// 将网络返回的数据的所有的key组成一个 list<String>
  List<String> progressProvinces(List<dynamic> bigDic) {
    List<String> list = [];
    for (int i = 0 ; i < bigDic.length ; i++) {
      Map<String,dynamic> reali = bigDic[i];
      list.add(reali.keys.first);
    }
    return list;
  }

  /// 将网络返回的数据的所有value组成一个二维数据 List<List<String>>
  List<dynamic> progressCity(List<dynamic> bigDic) {
    List<dynamic> list = [];
    for (int i = 0 ; i < bigDic.length ; i++) {
      Map<String,dynamic> reali = bigDic[i];
      List<dynamic> valuesList = reali.values.first;
      list.add(valuesList);
    }
    return list;
  }

  /// 查找车辆信息
  Future<List<MoveCarModel>> selectByProvinces(String province, String city, String carNO) async {
    String url =IIHTTPStaticInfos.moveCarSelectInfosWithProvince + 'province=$province&city=$city&number=$carNO';
    List<dynamic> infos = await IIHTTPRequestUti().request(IIHTTPRequestEnum.gEt, null, url);
    List<MoveCarModel> result = [];
    for (int i = 0 ; i < infos.length ; i++) {
      MoveCarModel eachModel = MoveCarModel.fromJson(infos[i]);
      result.add(eachModel);
    }
    return result;
  }

  /// 根据入参返回所在的idx
  int getRealProvinceIdx(dynamic bigList,String realInfo) {
    if (null == bigList) { return 0;}
    for (int i = 0 ; i < bigList.length ; i++ ) {
      if (bigList[i].toString() ==realInfo) {
        return i;
      }
    }
    return 0;
  }
}