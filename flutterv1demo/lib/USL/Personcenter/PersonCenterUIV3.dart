import 'package:flutter/material.dart';
import 'package:flutterv1demo/USL/Personcenter/PersonUserSmallRow.dart';
import 'package:flutterv1demo/USL/Personcenter/PersonNormalCell.dart';

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
          child: ListView(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // 切换企业按钮
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    padding: EdgeInsets.only(right:15),
                    child:Text('🔙back'),
                      onPressed:() {
                        Navigator.pop(context);
                    }
                ),
                  FlatButton(
                    padding: EdgeInsets.only(right:15),
                    child: Text(
                  '切换企业',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 19,
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
                height: 250,
                margin: EdgeInsets.all(15),
                // 装饰
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(7.0),
                  boxShadow: [
                    BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.5, 0.5),
                    blurRadius: 7.0
                    )
                    ]
                ),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    // 姓名
                    padding: EdgeInsets.only(top:25,left: 15),
                    height: 80,
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Noah_shan',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                          )
                          ),
                        Container(
                          margin: EdgeInsets.only(left: 170),
                          child: CircleAvatar(
                            radius: 23,
                            backgroundImage: NetworkImage('http://p1.so.qhmsg.com/bdr/1080__/t0181c97fa805012506.jpg'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //邮箱
                  PersonUserSmallRow("shanwzh@inspur.com", "images/personcenter_email.png"),
                  //电话
                  PersonUserSmallRow("18763994423", "images/personcenter_phone.png"),
                  //工号
                  PersonUserSmallRow("0500474", "images/personcenter_userno.png"),
                  //集团名称
                  PersonUserSmallRow("浪潮集团", "images/personcenter_company.png"),
                  //部门名称
                  PersonUserSmallRow("平台与技术部门-云+组", "images/personcenter_depart.png"),
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

/// 获取状态栏高度
  double getStateHeight() {
    print(MediaQuery.of(context).padding.top);
    return MediaQuery.of(context).padding.top;
  }
/// 屏幕宽度
  double getWeightScreen() {
    return MediaQuery.of(context).size.width;
  }

}

