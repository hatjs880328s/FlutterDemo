import 'package:flutter/gestures.dart';
import "package:flutter/material.dart";
import 'package:flutter/cupertino.dart';
import 'package:flutterv1demo/USL/Personcenter/PersonCenterUIV3.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutterv1demo/BLL/Login/LoginBll.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  //注册点击手势
  TapGestureRecognizer _tapGestureRecognizer = new TapGestureRecognizer();
  //用户名的controller
  TextEditingController nameCon = TextEditingController();
  //密码的controller
  TextEditingController pwdCon = TextEditingController();
  //用户名focus
  FocusNode nameFo = FocusNode();
  //密码focus
  FocusNode pwdFo = FocusNode();

  //viewdidload - 添加监听&处理小尾巴的显示与否
  @override 
  void initState() {
    super.initState();
    nameFo.addListener((){
      setState(() {
      });
    });
    pwdFo.addListener((){
      setState(() {
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    //return null;
    return Material(
      child: ListView(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //你好
          Container(
            padding: EdgeInsets.only(top: 100, left: 30),
            child: Text(
              '你好，',
              style: TextStyle(
                color: Colors.black,
                fontSize: 26, 
              )
            )
          ),
          //欢迎
          Container(
            padding: EdgeInsets.only(top:10, left: 30),
            child: Text(
              '欢迎使用云+',
              style: TextStyle(
                color: Colors.black,
                fontSize: 26, 
              )
            )
          ),
          //用户名
          Container(
            padding: EdgeInsets.only(left: 30, top: 40, right: 30),
            child: TextField(
              focusNode:nameFo,
              controller:nameCon,
              decoration:InputDecoration(
                labelText: '账户/邮箱/手机号',
                suffixIcon: !nameFo.hasFocus ? null : IconButton(
                  icon: Icon(Icons.clear),
                  onPressed:() {
                    nameCon.clear();
                  }
                ),
                labelStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
                hintText: '输入用户名',
              ),
            ),
          ),
          //密码
          Container(
            padding: EdgeInsets.only(left: 30, top: 40, right: 30),
            child: TextField(
              focusNode:pwdFo,
              controller:pwdCon,
              obscureText: true,
              decoration:InputDecoration( 
                labelText: '密码',
                suffixIcon: !pwdFo.hasFocus ? null : IconButton(
                  icon: Icon(Icons.clear),
                  onPressed:() {
                    pwdCon.clear();
                  }
                ),
                labelStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
                hintText: '输入密码',
              ),
            ),
          ),
          //短信登陆 & 忘记密码？
          Container(
            padding: EdgeInsets.only(left: 30, top: 20, right: 30),
            child: Row(
              children: <Widget>[
                Container(
                  child: Text(
                    '短信登陆',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(left: 230),
                  child: Text(
                    '忘记密码?',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          //登陆按钮
          Container(
            margin: EdgeInsets.only(left: 30, top: 40,right: 30),
            height: 45,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(4.0),
                ), 
            child: Container(
              child: FlatButton(
                child: Text(
                  '登录',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  login();
                }
              ),
              ),
            ),
          //注册
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 20),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '还没有账户？',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14
                    ),
                  ),
                  TextSpan(
                    text: '注册',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14
                    ),
                    recognizer:_tapGestureRecognizer
                    ..onTap = () {
                      signIn();
                    }
                  ),
                ],
            ),
            ),
          ),
        ],
      ),
    );
  }

/// 注册事件
  void signIn() {
    print('去注册...');
  }

///登录事件
  Future login() async {
    Fluttertoast.showToast(
      msg: '登录中,请稍候...',
      gravity: ToastGravity.CENTER,
      fontSize: 17,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      timeInSecForIos: 100,
    );
    nameFo.unfocus();
    pwdFo.unfocus();
    bool result = await LoginBll().login(nameCon.text, pwdCon.text);
    Fluttertoast.cancel();
    if (result == true) {
      Navigator.push(context, new MaterialPageRoute(builder: (context) {
      return new PersonCenterUIV3();
    }));
    } else { 
      Fluttertoast.showToast(
        msg: '登录失败.',
        gravity: ToastGravity.CENTER,
        fontSize: 17,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        timeInSecForIos: 1,
      );
    }
  }
}