import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {

  CounterWidget({Key key,
  this.intvalue: 0
  }): super(key:key);

  final int intvalue;
  // @override
  // Widget build(BuildContext context) {

  // }
  @override
    _CounterWidgetState createState() {
      // TODO: implement createState
      return new _CounterWidgetState();
    }

}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter;

  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      _counter = widget.intvalue;
    }
  @override
    Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: Text("Counter vc"),
      ),
      body: Center(
        child: FlatButton(
          child: Text('$_counter'),
          onPressed: (){
            setState(() {
              ++_counter;
            });
          },
        ),
      )
    );
    }

  @override
    void didUpdateWidget(CounterWidget oldWidget) {
      // TODO: implement didUpdateWidget
      super.didUpdateWidget(oldWidget);
    }

  @override
    void deactivate() {
      // TODO: implement deactivate
      super.deactivate();
    }

  @override
    void dispose() {
      // TODO: implement dispose
      super.dispose();
    }

  @override
    void didChangeDependencies() {
      // TODO: implement didChangeDependencies
      super.didChangeDependencies();
    }

  
}