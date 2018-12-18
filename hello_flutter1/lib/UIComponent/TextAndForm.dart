import 'package:flutter/material.dart';


class TextAndForm extends StatelessWidget {
@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: AppBar(
          title: Text('text & form'),
        ),
        body: CustomUInfo(),
      );
  }
  
}


class CustomUInfo extends StatefulWidget {
  @override
    _Customuinfostate createState() {
      // TODO: implement createState
      return _Customuinfostate();
    }
}

class _Customuinfostate extends State<CustomUInfo> {

  String username;

  String pwd;

  TextEditingController con = new TextEditingController();
  //on.text = 'sadfasdf';
  @override
    Widget build(BuildContext context) {
      return Column(
          children: <Widget>[
            TextField(
              controller: con,
              autofocus: true,
              decoration: InputDecoration(
                labelText: 'login in ',
                hintText: 'login in & pwd',
                prefixIcon: Icon(Icons.person),
              ),
              onChanged: (value){
                this.username = value;
                con.text = value;
              },
              
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'user pwd',
                hintText: 'input the users pwd',
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
              onChanged: (value){
                this.pwd = value;
                // controller 控制处理选中范围
                con.text = 'hello,world';
                con.selection = TextSelection(
                  baseOffset: 3,
                  extentOffset: con.text.length,
                );
              },
            )
          ],
        );
    }
}