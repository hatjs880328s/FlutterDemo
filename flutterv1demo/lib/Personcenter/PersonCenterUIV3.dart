import 'package:flutter/material.dart';
import 'package:flutterv1demo/Personcenter/PersonUserSmallRow.dart';
import 'package:flutterv1demo/Personcenter/PersonNormalCell.dart';

class PersonCenterUIV3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new PersonCenterUIV3State();
  }
}

// 个人中心UI
class PersonCenterUIV3State extends State<PersonCenterUIV3> {
  @override
  Widget build(BuildContext context) {
        return Material(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // 切换企业按钮
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    padding: EdgeInsets.only(top:15,right:15),
                  child: Text(
                  '切换企业',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                  ),
                  ), onPressed: () {
                    print('切换企业按钮点击');
                  },
                ),
                ],
              ),
              // 个人信息模块
              Container(
                height: 260,
                margin: EdgeInsets.all(15),
                // 装饰
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(7.0),
                  boxShadow: [
                    BoxShadow(
                    color: Colors.grey,
                    offset: Offset(2.0, 2.0),
                    blurRadius: 7.0
                    )
                    ]
                ),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    //color: Colors.grey,
                    padding: EdgeInsets.only(top:25,left: 15),
                    height: 80,
                    child: Text(
                        'Noah_shan',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                        ),
                      ),
                  ),
                  //邮箱
                  PersonUserSmallRow("shanwzh@inspur.com", Icon(Icons.mail,color: Colors.grey)),
                  //电话
                  PersonUserSmallRow("18763994423", Icon(Icons.phone,color: Colors.grey)),
                  //工号
                  PersonUserSmallRow("0500474", Icon(Icons.book,color: Colors.grey)),
                  //集团名称
                  PersonUserSmallRow("浪潮集团", Icon(Icons.compare,color: Colors.grey)),
                  //部门名称
                  PersonUserSmallRow("平台与技术部门-云+组", Icon(Icons.perm_camera_mic,color: Colors.grey)),
                ],
              ),
              ),
              // 底部的设置 & 卡包 & 关于
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  children: <Widget>[
                    //第一个
                    PersonNoramlCell('images/setting.png','设置'),
                    //第二个
                    PersonNoramlCell('images/cardbox.png','卡包'),
                    //第三个
                    PersonNoramlCell('images/aboutus.png','关于'),
                  ],
                ),
              )
        ],
      ),
    );
  }

}

