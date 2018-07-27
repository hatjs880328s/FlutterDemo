import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'demoGo',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }

}

class HomeState extends State<Home> {
  bool selectedItem = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navi bar info'),
      ),
      body: Content(isSecond:this.selectedItem),
      floatingActionButton: FloatingActionButton(onPressed: press),
    );
  }

  void press() {
    setState(() {
      this.selectedItem = !selectedItem;
    });
  }
}

// ignore: must_be_immutable
class Content extends StatefulWidget {
  Content({Key key, this.isSecond}): super(key:key){
    if (this.isSecond) {
      this.txtValue = 'hello,world';
    }else{
      this.txtValue = 'hello,china';
    }
  }
  bool isSecond = false;
  String txtValue = '';
  @override
  ContentState createState() {
    return new ContentState();
  }

}

class ContentState extends State<Content> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(this.widget.txtValue),
    );
  }
}
