import 'package:dio/dio.dart';
//import 'package:flutterv1demo/Model/user.dart';

class PersonCenterDAL {

  /// 获取用户信息
  Future<String> getUserInfo() async {
    Response res;
    Dio dio = new Dio();
    Options requestOpt = new Options(headers: {"" : ""});
    res = await dio.post('http://baidu.com',options: requestOpt);
    return res.data.toString();
  }
}