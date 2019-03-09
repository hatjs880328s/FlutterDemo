import 'package:flutter/material.dart';
import 'package:flutterv1demo/Model/MoveCar/MoveCarModel.dart';
import 'dart:ui';

class IIMoveCarList {
  IIMoveCarList(this.dataSource);

  final List<MoveCarModel> dataSource;

  BuildContext context;

  /// 回调函数
  dynamic callBackAction;

  Future<void> showCarInfos(BuildContext context) async {
    this.context = context;
    double top = MediaQuery.of(context).padding.top + 100 + 54;
    await showMenu(
        context: context,
        position: RelativeRect.fromLTRB(40.0, top, 40.0, 10.0),
        items: createItems());
  }

  List<PopupMenuItem<MoveCarModel>> createItems() {
    List<PopupMenuItem<MoveCarModel>> result = [];
    for (int i = 0; i < this.dataSource.length; i++) {
      PopupMenuItem eachItem = PopupMenuItem<MoveCarModel>(
        value: this.dataSource[i],
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
            this.callBackAction(this.dataSource[i]);
          },
          child: Container(
              width: MediaQuery.of(context).size.width - 140,
              child: Text(
                this.dataSource[i].id.province +
                    this.dataSource[i].id.city +
                    ' ' +
                    this.dataSource[i].id.number,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              )),
        ),
      );
      result.add(eachItem);
    }
    return result;
  }
}
