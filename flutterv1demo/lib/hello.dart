import 'package:flutter/material.dart';
import 'package:flutterv1demo/Model/user.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutterv1demo/USL/Personcenter/PersonCenterUIV3.dart';


class HelloDart extends StatefulWidget {

  @override
  HelloDartState createState() {
    return new HelloDartState();
  }
}

class HelloDartState extends State<HelloDart> {
  static const platform = const MethodChannel('com.inspur.www/iiplatform1');
  User shan = new User("sdaf", '2', 3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hello,dart"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // print("leading....");
            pop2Root();
          }
          )
        ),
      body: Center(
        child: Text('sadfsadf'),
      ),
      floatingActionButton: new RaisedButton(
        child: Text("print someone"),
        onPressed: () {
          //getBDInfo();
          Navigator.push(context, new MaterialPageRoute(builder: (context){
            return new PersonCenterUIV3();
          }));
        },
      ),
    );
    //return null;
  }

  Future<String> getBDInfo() async {
    Response response;
    Dio dio = new Dio();
    response = await dio.get("https://baidu.com");
    print(response.data.toString());
    return response.data.toString();
  }

/// 返回上一级页面
  Future pop2Root() async {
    try {
      platform.invokeMethod('pop2Root');
    } on PlatformException catch (e) {
      print("hehe, $e");
    }
  }
}
