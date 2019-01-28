import 'package:flutter/material.dart';

/// 个人中心 normal cell  
class PersonNoramlCell extends StatelessWidget {

  PersonNoramlCell(this.imageName, this.title);

  final String imageName;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      padding: EdgeInsets.only(left: 16),
      child: Row(
        children: <Widget>[
          
          // 图片
          Image(
            height: 32,
            width: 32,
            image: AssetImage(imageName),
          ),
          // 标题
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
          ),
          ),
          // 箭头
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Image(
              image: AssetImage("images/arrowrright.png"),
              height: 15,
              width: 15,
            ),
          ),
        ],
      ),
    );
  }
}