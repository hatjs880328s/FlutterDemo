import "package:flutter/material.dart";
import 'package:flutterv1demo/BLL/IIExc/IIExcBLL.dart';
import 'package:flutterv1demo/USL/Exchange/IIExcMainList.dart';
import 'package:flutterv1demo/Model/IIExcMODELS/IIExcBLLModel.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// 登录页面
class IIExcLogin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return IIExcLoginState();
  }
}

class IIExcLoginState extends State<IIExcLogin> {

  TextEditingController nameCon = TextEditingController(text: 'shanwzh@inspur.com');

  TextEditingController pwdCon = TextEditingController(text: 'sadfasdfasdf');

  FocusNode nameNode = FocusNode();

  FocusNode pwdNode = FocusNode();

  @override 
    void initState() {
    super.initState();
    nameNode.addListener((){
      setState(() {
      });
    });
    pwdNode.addListener((){
      setState(() {
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child:ListView(
        children: <Widget>[
          //第一个图片
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 91),
            child: Image(image: AssetImage("images/exchangelogin_top.png"))
          ),  
          // 用户名输入
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 30, top: 40, right: 30),
            child: TextField(
              focusNode: nameNode,
              controller: nameCon,
              decoration:InputDecoration(
                labelText: '邮箱账号',
                suffixIcon: !nameNode.hasFocus ? null : IconButton(//是否有清空按钮
                  icon: Icon(Icons.clear),
                  onPressed:() {
                    nameCon.clear();
                  }
                ),
                labelStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
                hintText: '输入邮箱账号',
              )
            ),
          ),
          //密码
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 30, top: 40, right: 30), 
            child: TextField(
              focusNode: pwdNode,
              controller: pwdCon,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "邮箱密码",
                suffixIcon: !pwdNode.hasFocus ? null : IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    pwdCon.clear();
                  }
                ),
                labelStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
                hintText: "请输入密码",
              ),
            ),
          ), 
          //登录按钮
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 70, left: 30, right: 30),
            height: 46,
            decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(4.0),
                ), 
            child: FlatButton(
              child: Text(
                '登录',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                loginExc();
              },
            ),
          ),    
        ],
      ),
    );
  }

/// 登录
  void loginExc() async {
    Fluttertoast.showToast(
      msg: '登录中,请稍候...',
      gravity: ToastGravity.CENTER,
      fontSize: 17,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      timeInSecForIos: 100,
    );
    String name = nameCon.text;
    String pwd = pwdCon.text;
    IIExcBLLModel model = await IIExcBll().login(name, pwd);
    Fluttertoast.cancel();
    Navigator.push(context, new MaterialPageRoute(builder: (context) {
      return new IIExcMainList('收件箱', model.models, model.folderid);
    }));

  } 
}