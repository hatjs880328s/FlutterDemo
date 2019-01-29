import 'package:dio/dio.dart';
import 'package:flutterv1demo/Utility/IIHTTP/IIHTTPRequestHeaderUti.dart';
import 'package:flutterv1demo/Utility/IIHTTP/IIHTTPStaticInfos.dart';

/// HTTP工具类
class IIHTTPRequestUti {

  // 请求token
  Future<String> requestToken(
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
        //contentType:ContentType.
      );
      try {
        response=await dio.post(
        IIHTTPStaticInfos.tokenUrl,
        options:options,
        );
        return response.data.toString();
      } on Exception catch (e) {
        print(e);
        return e.toString();
      }
      
  }


}