import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

/// 邮箱的主要列表页面
/// 1.需要有下拉舒心 & 上拉加载
/// 
/// 
/// 

class IIExcMainList extends StatefulWidget {

  String naviTitle = "";
  IIExcMainList(this.naviTitle);

  @override
  State<StatefulWidget> createState() {
    return IIExcMainListState();
  }

}

class IIExcMainListState extends State<IIExcMainList> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.naviTitle,),
        
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index){
          return Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  //邮件主题
                  Text(
                    ''
                  ),
                ],
              ),

            ],
          );
        },
      ),

    );
    //return null;
  }

}