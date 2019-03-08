import 'package:flutterv1demo/Utility/IIHTTP/IIHTTPRequestUti.dart';
import 'package:flutterv1demo/Utility/IIHTTP/IIHTTPRequestEnum.dart';
import 'package:flutterv1demo/Utility/IIHTTP/IIHTTPStaticInfos.dart';
/// 挪车 - bll
class MoveCarBll {

  /// 获取当前省以及下面的市信息
  Future<dynamic> getProvinces() async {
    List<dynamic> infos = await IIHTTPRequestUti().request(IIHTTPRequestEnum.gEt, null, IIHTTPStaticInfos.moveCarProvince);
    for (int i = 0 ; i < infos.length ; i++) {
      Map<String,dynamic> reali = infos[i];
      String realList = reali.keys.first;
      //key- 鲁
      print(realList);
      //values  - a,b,c,d...
      List<dynamic> valuesList = reali.values.first;
      print(valuesList[0].toString());
    }
  }
}