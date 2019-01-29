import 'package:flutter/material.dart';
import 'package:flutterv1demo/USL/Personcenter/PersonCenterUIV3.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  static const platform = const MethodChannel('com.inspur.www/iiplatform1');

  static const EventChannel eventChannel = const EventChannel('com.inspur.www/iiplatform');

  void _incrementCounter() {
    _getBatteryLevel();
    Navigator.push(context, new MaterialPageRoute(builder: (context){
      return new PersonCenterUIV3();
    }));
  }

  Future<Null> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }
    print("invoke success!!!");
    print(batteryLevel);
  }

  // 渲染前的操作，类似viewDidLoad
  @override
  void initState() {
    super.initState();
    eventChannel.receiveBroadcastStream(12345).listen(_onEvent,onError: _onError);
  }

  // 回调事件
  void _onEvent(Object event) {

  }
  // 错误返回
  void _onError(Object error) {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), 
    );
  }
}
