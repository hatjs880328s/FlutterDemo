import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new Scaffold(
        appBar: AppBar(
          title: Text('Form'),
        ),
        body: Forms(),
      );
    }
}

class Forms extends StatefulWidget {
  @override
    FormsState createState() {
      // TODO: implement createState
      return FormsState();
    }
}

class FormsState extends State<Forms> {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  GlobalKey _formKey= new GlobalKey<FormState>();

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                autofocus: true,
                controller: _unameController,
                decoration: InputDecoration(
                  labelText: '用户名',
                  hintText: '用户名或者邮箱',
                  icon: Icon(Icons.person),
                ),
                validator: (v) {
                  return v.trim().length > 0 ? null : '用户名不可为空，亲';
                },
              ),
              TextFormField(
                controller: _pwdController,
                decoration: InputDecoration(
                  labelText: '密码',
                  hintText: '输入密码',
                  icon: Icon(Icons.lock),
                ),
                validator: (v){
                  v.trim().length >= 6 ? null : '密码最少6位，亲';
                },
              ),
            ],
          ),
        ),
      );
    }
}