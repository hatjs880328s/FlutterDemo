import 'dart:_http';
import 'package:flutterv1demo/Model/LoginToken.dart';
import 'package:dio/dio.dart';
import 'package:flutterv1demo/Utility/IIHTTP/IIHTTPRequestHeaderUti.dart';
import 'package:flutterv1demo/Utility/IIHTTP/IIHTTPStaticInfos.dart';

/// HTTP工具类
class IIHTTPRequestUti {

  // 请求token
  Future<LoginToken> requestToken(
    String userName,
    String pwd
    ) async {
      Dio dio = new Dio();
      Response response;
      Map<String,dynamic> headers = IIHTTPRequestHeaderUti().getRequestTokenHeader();
      Map<String,String> parameters = IIHTTPRequestHeaderUti().getRequestTokenParams(
        userName,
        pwd,
        IIHTTPStaticInfos.tokenID,
        IIHTTPStaticInfos.tokenSecret
        );
      Options options = Options(
        headers:headers,
        data:parameters,
        contentType: ContentType.parse("application/x-www-form-urlencoded"),
      );
      try {
        response=await dio.post(
        IIHTTPStaticInfos.tokenUrl,
        options:options,
        );
        LoginToken tokenIns = LoginToken.fromJson(response.data);
        return tokenIns;
      } on Exception catch (e) {
        throw e;
      } on Error {
        throw Exception();
      }
      
  }

  Future<Map<String, dynamic>> request(String method, Map<String, dynamic> params) async {
    //return 
    
  }
}