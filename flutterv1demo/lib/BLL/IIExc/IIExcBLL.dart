import 'package:flutterv1demo/Utility/IIHTTP/IIHTTPRequestUti.dart';
import 'package:flutterv1demo/Utility/IIHTTP/IIHTTPRequestEnum.dart';
import 'package:flutterv1demo/Utility/IIHTTP/IIHTTPStaticInfos.dart';
// import 'dart:convert';
// import 'package:convert/convert.dart';
// import 'package:crypto/crypto.dart';


class IIExcBll {

  /// 登录操作 - 获取下来信息只需要第一个文件夹id [这里的密码强制使用处理过后的]
  Future<bool> login(String name, String pwd) async {
    Map<String, dynamic> params = {"email": name, "password": "H6vZ+nfJV0Ins8hoDayCaA=="};
    String requestUrl = IIHTTPStaticInfos.iiexcLogin;
    bool result = await IIHTTPRequestUti().request(IIHTTPRequestEnum.post, params, requestUrl);
    //登录成功之后立马获取文件夹信息
    List<dynamic> mapInfo = await getFolders();
    print(mapInfo);
    Map<String, dynamic> maps = mapInfo[0];
    print(maps);
    return true;
  }

    // md5 加密
// String generateMd5(String data) {
//   var content = new Utf8Encoder().convert(data);
//   var digest = md5.convert(content);
//   // 这里其实就是 digest.toString()
//   return hex.encode(digest.bytes);
// }

  /// 获取所有文件信息
  Future<List<dynamic>> getFolders() async {
    String requestURL = IIHTTPStaticInfos.iiexcFolder;
    try {
      List<dynamic> result = await IIHTTPRequestUti().request(IIHTTPRequestEnum.gEt, {}, requestURL);
      return result;
    }on Exception catch (e) {
      print(e);
      return null;
    }
  }
}