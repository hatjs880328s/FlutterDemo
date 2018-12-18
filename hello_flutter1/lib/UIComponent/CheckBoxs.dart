import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CheckBoxs extends StatelessWidget {
    @override
      Widget build(BuildContext context) {
      return new Scaffold(
        appBar: AppBar(
          title: Text('checkbox'),
        ),
        body:CustomBox());
    }
}

/// 一个带有状态的widget-checkbox
class CustomBox extends StatefulWidget {
  @override
    _Custombox createState() {
      // TODO: implement createState
      return new _Custombox();
    }
}

class _Custombox extends State<CustomBox> {
      // TODO: implement build
  bool _switchSelected=true; //维护单选开关状态
  bool _checkboxSelected=true;//维护复选框状态
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Switch(
          value: _switchSelected,//当前状态
          onChanged:(value){
            //重新构建页面  
            setState(() {
              _switchSelected=value;
            });
          },
        ),
        CupertinoSwitch(
          activeColor: Colors.blue,
          value: _switchSelected,
          onChanged: (value){
            setState(() {
              _switchSelected = value;
            });
          },
        ),
        Checkbox(
          value: _checkboxSelected,
          activeColor: Colors.red, //选中时的颜色
          onChanged:(value){
            setState(() {
              _checkboxSelected=value;
            });
          } ,
        )
      ],
    );
  }
    }