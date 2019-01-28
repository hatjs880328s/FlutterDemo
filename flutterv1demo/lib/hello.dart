import 'package:flutter/material.dart';
import 'package:flutterv1demo/Model/user.dart';
import 'package:dio/dio.dart';

class HelloDart extends StatefulWidget {

  @override
  HelloDartState createState() {
    return new HelloDartState();
  }
}

class HelloDartState extends State<HelloDart> {
  User shan = new User("sdaf", '2', 3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("hello,dart"),),
      body: Center(
        child: Text('sadfsadf'),
      ),
      floatingActionButton: new RaisedButton(
        child: Text("print someone"),
        onPressed: () {
          getBDInfo();
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
}
