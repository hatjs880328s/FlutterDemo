import 'package:flutter/material.dart';

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
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: TextField(
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          labelText: '切换企业',
        ),
      ),
    );
  }

}