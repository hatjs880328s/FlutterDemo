import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async' show Future;
import 'package:hello_flutter1/Route.dart';
import 'package:hello_flutter1/TabBox.dart';
import 'package:flutter/cupertino.dart';
import 'package:hello_flutter1/iosStyle.dart';
import 'package:hello_flutter1/UIComponent/TextUI.dart';

// main函数-入口函数
void main() => runApp(new MyApp());

// myapp类-集成自一个状态不变的widget
class MyApp extends StatelessWidget {
  // 重写了build方法，返回widget
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "new_page" : (context) => NewRoute("hello,world; new route"),
        "new_counter" : (context) => CounterWidget(),
        "new_box" : (context) => TabBoxParent(),
        "new_ios" : (context) => IosStyle(),
        "new_ui" : (context) => TextUI(),
      },
      home: new MyHomePage(title: 'Home page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            new RandomWordsWidget(),
            FlatButton(
              child: Text("open new route"),
              textColor: Colors.blue,
              onPressed: onPress
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), 
    );
  }

  void onPress() {
    Navigator.pushNamed(context, "new_ui");
    // Navigator.push(context, new MaterialPageRoute(builder: (context) {
    //   return new NewRoute();
    // }));
  }
}

class NewRoute extends StatelessWidget {
  final String name;
  NewRoute(this.name);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Center(
        child: AssetsImage()
      )
    );
  }
}

// 生成随机字符串的widget
class RandomWordsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Text("hello,randow str")
    );
  }
}

Future<String> loadAssets() async {
  return await rootBundle.loadString('assets/hello.txt');
}

class AssetsImage extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    // return new DecoratedBox(
    //   decoration: new BoxDecoration(
    //     image: new DecorationImage(
    //       image: new AssetImage('assets/hello.png'),
    //     ),
    //   ),
    // );
    // 如果是某个package下的图片，需要制定package属性
    return Image.asset('assets/hello.png');
  }
}