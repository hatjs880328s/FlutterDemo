import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterv1demo/BLL/MoveCar/MoveCarBLL.dart';

const double _kPickerSheetHeight = 216.0;
const double _kPickerItemHeight = 32.0;

class CupertinoPickerDemo extends StatefulWidget {

  static const String routeName = '/cupertino/picker';

  

  Widget showWidget;

  CupertinoPickerDemo(this.showWidget);

  @override
  _CupertinoPickerDemoState createState() => _CupertinoPickerDemoState();
}

class _CupertinoPickerDemoState extends State<CupertinoPickerDemo> {

  int _selectedColorIndex = 0;

  MoveCarBll bll = MoveCarBll();

  /// 城市信息
  List<dynamic> cityInfos;

  /// 网络获取的大数据结构
  List<dynamic> bigInfos;

  List<String> provinces = [];

  List<List<String>> cityCharList = [];

  getDate() async {
    this.bigInfos = await bll.getProvinces();
    this.cityInfos = bll.progressCity(this.bigInfos);
    this.provinces = bll.progressProvinces(this.bigInfos);
    
  }

/// 创建两个picker
  Widget _buildBottomPicker(Widget pickerLeft, Widget pickerRight) {
    return Stack(children: <Widget>[
      Positioned(
        top: MediaQuery.of(context).size.height - _kPickerSheetHeight,
        left: 0,
        child: Container(
          height: _kPickerSheetHeight,
          width: MediaQuery.of(context).size.width / 2,
          padding: const EdgeInsets.only(top: 6.0),
          color: CupertinoColors.white,
          child: DefaultTextStyle(
            style: const TextStyle(
              color: CupertinoColors.black,
              fontSize: 22.0,
            ),
            child: GestureDetector(
              // Blocks taps from propagating to the modal sheet and popping.
              onTap: () {},
              child: SafeArea(
                top: false,
                child: pickerLeft,
              ),
            ),
          ),
        ),
      ),
      Positioned(
        top: MediaQuery.of(context).size.height - _kPickerSheetHeight,
        left: MediaQuery.of(context).size.width / 2,
        child: Container(
          height: _kPickerSheetHeight,
          width: MediaQuery.of(context).size.width / 2,
          padding: const EdgeInsets.only(top: 6.0),
          color: CupertinoColors.white,
          child: DefaultTextStyle(
            style: const TextStyle(
              color: CupertinoColors.black,
              fontSize: 22.0,
            ),
            child: GestureDetector(
              // Blocks taps from propagating to the modal sheet and popping.
              onTap: () {},
              child: SafeArea(
                top: false,
                child: pickerRight,
              ),
            ),
          ),
        ),
      ),
    ]);
  }

  Widget _buildColorPicker(BuildContext context) {
    final FixedExtentScrollController leftCon =
        FixedExtentScrollController(initialItem: _selectedColorIndex);

    final FixedExtentScrollController rightCon =
        FixedExtentScrollController(initialItem: _selectedColorIndex);
    return GestureDetector(
      onTap: () async {
        await this.getDate();
        await showCupertinoModalPopup<void>(
          context: context,
          builder: (BuildContext context) {
            return _buildBottomPicker(
                CupertinoPicker(
                  magnification: 1.0,
                  scrollController:leftCon,
                  itemExtent: _kPickerItemHeight,
                  backgroundColor: CupertinoColors.white,
                  useMagnifier: true,
                  onSelectedItemChanged: (int index) {
                    // 当正中间选项改变时的回调
                    setState(() => _selectedColorIndex = index);
                  },
                  children:
                    List<Widget>.generate(provinces.length, (int index) {
                    return Center(
                      child: Text(provinces[index]),
                    );
                  }),
                ),
                CupertinoPicker(
                  magnification: 1.0,
                  scrollController:rightCon,
                  itemExtent: _kPickerItemHeight,
                  backgroundColor: CupertinoColors.white,
                  useMagnifier: true,
                  onSelectedItemChanged: (int index) {
                    // 当正中间选项改变时的回调
                    setState(() => _selectedColorIndex = index);
                  },
                  children:
                    List<Widget>.generate(provinces.length, (int index) {
                    return Center(
                      child: Text(provinces[index]),
                    );
                  }),
                ));
          },
        );
      },
      child: Container(
        child: widget.showWidget,//Text('hello'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildColorPicker(context),
    );
  }


}
