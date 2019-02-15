import "package:flutter/material.dart";

/// 登录页面
class IIExcMainList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return IIExcMainListState();
  }
}

class IIExcMainListState extends State<IIExcMainList> {

  TextEditingController nameCon = TextEditingController();

  TextEditingController pwdCon = TextEditingController();

  FocusNode nameNode = FocusNode();

  FocusNode pwdNode = FocusNode();

  @override 
    void initState() {
      super.initState();
      nameNode.addListener(() {
        setState() {
        };
      });
      pwdNode.addListener(() {
        setState() {
        };
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
            padding: EdgeInsets.only(top: 120),
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

  void loginExc() {
    String name = nameCon.text;
    String pwd = pwdCon.text;

  } 
}