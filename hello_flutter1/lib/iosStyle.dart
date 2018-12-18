import 'package:flutter/cupertino.dart';

class IosStyle extends StatelessWidget {
  Widget build (BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Ios style'),
      ),
      child: Center(
        child: CupertinoButton(
          color: CupertinoColors.activeBlue,
          child: Text('i\'m button'),
          onPressed: (){},
        ),
      ),
    );
  }
}
