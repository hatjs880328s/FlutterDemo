import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterv1demo/BLL/MoveCar/MoveCarBLL.dart';

const double _kPickerSheetHeight = 216.0;
const double _kPickerItemHeight = 32.0;

class IIPicker extends StatefulWidget {

  IIPicker(this.cityInfos, this.provinces);

  /// 城市信息
  final List<dynamic> cityInfos;

  /// 省信息
  final List<String> provinces;

  /// 回调函数
  dynamic backAction;

  @override
  IIPickerState createState() => IIPickerState();
}

class IIPickerState extends State<IIPicker> {

  /// 一级省选择idx
  int _selectedColorIndex = 0;

  /// 二级市选择idx
  int rightSelectIDX = 0;

  MoveCarBll bll = MoveCarBll();

  /// 左边的picker
  CupertinoPicker pickerOne;

  /// 右边的picker
  CupertinoPicker pickerTwo;

  FixedExtentScrollController leftCon = FixedExtentScrollController(initialItem: 0);

  FixedExtentScrollController rightCon = FixedExtentScrollController(initialItem: 0);

  /// 创建两个picker
  Widget _buildBottomPicker(Widget pickerLeft, Widget pickerRight) {
    //widget.backAction('dsfd');
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
    //await getDate();
    pickerOne = CupertinoPicker(
      magnification: 1.0,
      scrollController:leftCon,
      itemExtent: _kPickerItemHeight,
      backgroundColor: CupertinoColors.white,
      useMagnifier: true,
      onSelectedItemChanged: (int index) {
        // 当正中间选项改变时的回调
        _selectedColorIndex = index;
        rightSelectIDX = 0;
        this.rightCon.jumpToItem(0);
        widget.backAction(_selectedColorIndex, rightSelectIDX);
        setState(() {
          
        });
      },
      children: List<Widget>.generate(widget.provinces.length, (int index) {
        return Center(
          child: Text(widget.provinces[index]),
        );
      }),
    );
    pickerTwo = CupertinoPicker(
      magnification: 1.0,
      scrollController:rightCon,
      itemExtent: _kPickerItemHeight,
      backgroundColor: CupertinoColors.white,
      useMagnifier: true,
      onSelectedItemChanged: (int index) {
        // 当正中间选项改变时的回调
        rightSelectIDX = index;
        widget.backAction(_selectedColorIndex, rightSelectIDX);
      },
      children: List<Widget>.generate(widget.cityInfos[_selectedColorIndex].length,
          (int index) {
        return Center(
          child: Text(widget.cityInfos[_selectedColorIndex][index].toString()),
        );
      }),
    );
    return _buildBottomPicker(
      pickerOne,
      pickerTwo,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildColorPicker(context),
    );
  }
}
