import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ImageAndIcon extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      return new CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('图片 & Icon',style: TextStyle(
            color: Colors.white,
          ),),
          backgroundColor: Colors.blue[600],
          actionsForegroundColor: Colors.white,
        ),
        child: Column(
          children: <Widget>[
            Image(
              image: AssetImage('assets/hello.png'),
              width: 80.0,
              height: 50.0,
              fit: BoxFit.fill,
              alignment: Alignment.center,
            ),
            Image(
              image: NetworkImage('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1545722599&di=f6660c85757fad15fb4563dcb2f8ef8b&imgtype=jpg&er=1&src=http%3A%2F%2Fpic36.photophoto.cn%2F20150713%2F1155116863448300_b.jpg'),
              width: 100.0,
              height: 100.0,
            ),
            Row(
              children: <Widget>[
                Icon(Icons.thumb_up,color: Colors.red),
                Icon(Icons.thumb_up,color: Colors.green),
                Icon(Icons.error,color: Colors.blue),
              ],
            ),
          ],
        ),
        //backgroundColor: Colors.blue[500],
      );
    }
}