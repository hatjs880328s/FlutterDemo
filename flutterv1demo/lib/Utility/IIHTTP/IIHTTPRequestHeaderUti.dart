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
    // 添加语言
    header["Accept-Language"] = "zh-Hans";
    // 添加代理
    header["User-Agent"] = "iOS/12.1(Apple x86_64) CloudPlus_Phone/3.0.0";
    // 添加设备ID
    header["X-Device-ID"] = "0cb0a5d5c973b66f9ebe710f3f0c4b0210336d56";
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