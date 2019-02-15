import 'package:flutterv1demo/Utility/IIHTTP/IIHTTPRequestUti.dart';
import 'package:flutterv1demo/Utility/IIHTTP/IIHTTPRequestEnum.dart';
import 'package:flutterv1demo/Utility/IIHTTP/IIHTTPStaticInfos.dart';


class IIExcBll {

  /// 登录操作 - 获取下来信息只需要第一个文件夹id
  void login(String name, String pwd) async {
    Map<String, dynamic> params = {"email": name, "password": pwd};
    String requestUrl = IIHTTPStaticInfos.iiexcLogin;
    Map<String, dynamic> result = await IIHTTPRequestUti().request(IIHTTPRequestEnum.post, params, requestUrl);
    print(result);
  }
}