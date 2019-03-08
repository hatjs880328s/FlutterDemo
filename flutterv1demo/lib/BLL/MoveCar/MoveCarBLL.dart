import 'package:flutterv1demo/Utility/IIHTTP/IIHTTPRequestUti.dart';
import 'package:flutterv1demo/Utility/IIHTTP/IIHTTPRequestEnum.dart';
import 'package:flutterv1demo/Utility/IIHTTP/IIHTTPStaticInfos.dart';
/// 挪车 - bll
class MoveCarBll {

  /// 获取当前省以及下面的市信息
  Future<List<dynamic>> getProvinces() async {
    List<dynamic> infos = await IIHTTPRequestUti().request(IIHTTPRequestEnum.gEt, null, IIHTTPStaticInfos.moveCarProvince);
    // for (int i = 0 ; i < infos.length ; i++) {
    //   Map<String,dynamic> reali = infos[i];
    //   String realList = reali.keys.first;
    //   //key- 鲁
    //   print(realList);
    //   //values  - a,b,c,d...
    //   List<dynamic> valuesList = reali.values.first;
    //   print(valuesList[0].toString());
    // }
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
}