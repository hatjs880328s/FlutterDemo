import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterv1demo/USL/Personcenter/PersonCenterUIV3.dart';
import 'package:flutterv1demo/USL/Login/Login.dart';

class MainTabbar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MaintabbarState();
  }

}

class MaintabbarState extends State<MainTabbar> with SingleTickerProviderStateMixin {

  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new TabBarView(
          controller: controller,
          children: <Widget>[
            new Login(),
            new Login(),
            new PersonCenterUIV3(),
          ],
        ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(bottom: getTabbarPaddingBot()),
        child: new Material(
          color: Colors.white,
          child: new TabBar(
            controller: controller,
            labelColor: Colors.blue,
            indicatorWeight: 0.01,
            unselectedLabelColor: Colors.black26,
            tabs: <Widget>[
              new Tab(
                text: "登录",
                icon: new Icon(Icons.local_gas_station),
              ),
              new Tab(
                text: "登录",
                icon: new Icon(Icons.map),
              ),
              new Tab(
                text: "我",
                icon: new Icon(Icons.person),
              ),
            ],
          ),
        )
      ),
    );
  }

/// 判定是否是IOS 并且判定是否有安全区域
  double getTabbarPaddingBot() {
    if (Platform.isIOS)  {
      return MediaQuery.of(context).padding.top > 22 ? 20 : 0;
    } else {
      return 0;
    }
  }

}