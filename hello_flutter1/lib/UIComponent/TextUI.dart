import 'package:flutter/material.dart';
import 'package:hello_flutter1/UIComponent/ImageAndIcon.dart';
import 'package:hello_flutter1/UIComponent/CheckBoxs.dart';
import 'package:hello_flutter1/UIComponent/TextAndForm.dart';

class TextUI extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new Scaffold(
        appBar: AppBar(
          title: Text('UI Component'),
        ),
        body: Column(
          children: <Widget>[
            Text('hello,world' * 6, textAlign: TextAlign.center),
            // overflow 是截断字符串的方式
            Text('hello,world'* 6,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(
              color: Colors.red,
              fontSize: 20.0,
              height: 1.5,
              fontFamily: 'Courier',
            )),
            Text.rich(TextSpan(
              children: [
                TextSpan(
                  text: 'home '
                ),
                TextSpan(
                  text: 'www.baidu.com',
                  style: TextStyle(
                    color: Colors.green
                  ),
                )
              ]
            )),
            RaisedButton(
              child: Text('图片&icon'),
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new ImageAndIcon();
                }));
              },
              padding: EdgeInsets.only(left: 32.0,top: 31.0,bottom: 31.0,right: 33.0),
              
            ),
            FlatButton(
              child: Text('checkbox'),
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new CheckBoxs();
                }));
              },
              padding: EdgeInsets.only(left: 32.0,top: 31.0,bottom: 31.0,right: 33.0),
            ),
            OutlineButton(
              child: Text('text and form'),
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new TextAndForm();
                }) );
              },
              padding: EdgeInsets.only(left: 32.0,top: 31.0,bottom: 31.0,right: 33.0),
            ),
            IconButton(
              icon: Icon(Icons.thumb_down),
              onPressed: (){},
              padding: EdgeInsets.only(left: 32.0,top: 31.0,bottom: 31.0,right: 33.0),
            ),
            RaisedButton(
              child: Text('submit'),
              splashColor: Colors.grey,
              colorBrightness: Brightness.dark,
              color: Colors.blue[700],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
              onPressed: (){},
              elevation: 3.0,
              highlightElevation: 12.0,
              padding: EdgeInsets.only(left: 32.0,top: 31.0,bottom: 31.0,right: 33.0),
            ),
          ],
        ),
      );
    }
}

