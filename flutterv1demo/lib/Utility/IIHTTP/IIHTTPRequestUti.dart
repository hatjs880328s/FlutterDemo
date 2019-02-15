//import 'dart:_http';
import 'dart:io';
import 'package:flutterv1demo/Model/LoginToken.dart';
import 'package:dio/dio.dart';
import 'package:flutterv1demo/Utility/IIHTTP/IIHTTPRequestHeaderUti.dart';
import 'package:flutterv1demo/Utility/IIHTTP/IIHTTPStaticInfos.dart';
import 'package:flutterv1demo/Utility/IIHTTP/IIHTTPRequestEnum.dart';

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

  // 普通的网络请求-返回类型需要业务自处理
  Future<dynamic> request(
    IIHTTPRequestEnum method, 
    Map<String, dynamic> params, 
    String requestURL) async {
      Dio dio = new Dio();
      Response response;
      dynamic result;
      // 处理参数虚序列化方式
      ContentType paraSeType = method == IIHTTPRequestEnum.post ? ContentType.json : ContentType.parse("application/x-www-form-urlencoded");
      Map<String,dynamic> headers = await IIHTTPRequestHeaderUti().getHttpHeader();
      Options opt = Options(headers: headers, data: params);
      try  {
        if (method == IIHTTPRequestEnum.post) {
          response = await dio.post(requestURL, options: opt);
          result = response.data;
        } else {
          response = await dio.get(requestURL, options: opt);
          result  = response.data;
        }
        return result;
      } on Exception catch (e) {
        print(e);
        throw e;
      } on Error catch (error){
        print(error);
        throw Exception();
      }
  }
}