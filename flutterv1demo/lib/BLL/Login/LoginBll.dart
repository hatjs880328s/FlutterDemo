import 'dart:convert';
import 'package:flutterv1demo/Utility/IIHTTP/IIHTTPRequestUti.dart';
import 'package:flutterv1demo/Model/LoginToken.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutterv1demo/Utility/IIGlobal/IIGlobalInfo.dart';

class LoginBll {

  /// 登录 & 获取token
  Future<bool> login(String name,String pwd) async {
    try {
      LoginToken resutInfo = await IIHTTPRequestUti().requestToken(name, pwd);
      await retainData(json.encode(resutInfo.toJson()));
      return true;
    } on Exception {
      return false;
    }
  }

  // 登录 & 获取token - - 数据持久化
  Future retainData(String jsonData) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString(IIGlobalInfo.tokenKey, jsonData);
  }

  // 获取用户持久化信息
  Future<LoginToken> getLoginData() async {
    var prefs = await SharedPreferences.getInstance();
    String jsonStr = prefs.getString(IIGlobalInfo.tokenKey);
    dynamic user = json.decode(jsonStr);
    LoginToken suerInfo = LoginToken.fromJson(user);
    return suerInfo;
  }
}