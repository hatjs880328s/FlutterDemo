import 'package:flutter/material.dart';

/// 个人中心 normal cell  
class PersonNoramlCell extends StatefulWidget {

  PersonNoramlCell(this.imageName, this.title);

  final String imageName;
  final String title;

  @override
  PersonNoramlCellState createState() {
    return new PersonNoramlCellState();
  }
}

class PersonNoramlCellState extends State<PersonNoramlCell> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      padding: EdgeInsets.only(left: 16),
      child: Column(
        children: <Widget>[
          Container(
            
            height: 44,
            child: Row(
        children: <Widget>[
          // 图片
          Image(
            height: 32,
            width: 32,
            image: AssetImage(widget.imageName),
          ),
          // 标题
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              widget.title,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
          ),
          ),
          // 箭头
          Container(
            //alignment: Alignment.bottomRight,
            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width - 150),
            child: IconButton(
              icon:Image(
              image: AssetImage("images/arrowrright.png"),
              height: 15,
              width: 15,
              ), onPressed: () {
                print("hello,title is ${widget.title}");
              },
          ),
          ),
        ],
      ),
          ),
        Container(
          margin: EdgeInsets.only(left: 45),
          height: 0.5,
          color: Colors.grey,
        ),
      ],
      )
    );
  }
}