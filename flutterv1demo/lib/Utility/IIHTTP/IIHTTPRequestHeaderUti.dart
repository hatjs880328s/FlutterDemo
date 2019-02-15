// HTTP请求的header & parmas
import 'package:flutterv1demo/BLL/Login/LoginBll.dart';
import 'package:flutterv1demo/Model/LoginToken.dart';
class IIHTTPRequestHeaderUti {

  /// 获取普通header
  Future<Map<String,String>> getHttpHeader() async {
    Map<String,String> header = Map();
    // 添加token
    LoginToken tokenInfo = await LoginBll().getLoginData();
    header["Authorization"] = "bearer " + tokenInfo.accessToken;
    // 添加enterpriseid
    header["X-ECC-Current-Enterprise"] = "10000";
    return header;
  }

  /// 获取普通params
  Map<String,String> getHttpParams() {
    Map<String,String> header = Map();
    header['token'] = 'sdafasdf';
    return header;
  }
  
  /// 获取请求token的header
  Map<String,dynamic> getRequestTokenHeader() {
    Map<String,dynamic> header = Map();
    header['Content-Type'] = 'application/x-www-form-urlencoded';
    return header;
  }

  /// 获取请求token的参数
  Map<String,String> getRequestTokenParams(String userName, String password, String id, String secret) {
    Map<String,String> header = Map();
    header['grant_type'] = 'password';
    header['scope'] = '';
    header['client_id'] = id;
    header['client_secret'] = secret;
    header['username'] = userName;
    header['password'] = password;
    return header;
  }
}