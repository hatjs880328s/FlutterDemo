import 'package:flutter/material.dart';

class TabBoxParent extends StatefulWidget {

@override
  _Tabboxstate createState() {
    // TODO: implement createState
    return new _Tabboxstate();
  }
}

class _Tabboxstate extends State<TabBoxParent> {

  bool active = false;

  tapAction(bool value) {
    setState(() {
          active = value;
        });
  }

  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('tapbox'),
      ),
      body: Center(
        child: new Tapbox(
          active: this.active,
          ontap: this.tapAction,
        )
      ));
  }
}

class Tapbox extends StatelessWidget {

Tapbox({Key key,this.active: false,@required this.ontap}): super(key:key);

final bool active;

final ValueChanged<bool> ontap;

void _tapchange() {
  this.ontap(!active);
}

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new GestureDetector(
      onTap: _tapchange,
      child: new Container(
        child: new Center(
          child: new Text(
            active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
    }
