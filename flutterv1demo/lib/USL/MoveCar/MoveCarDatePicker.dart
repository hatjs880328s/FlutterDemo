import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MoveCarDatePicer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MoveCarDatePickerState();
  }
}

class MoveCarDatePickerState extends State<MoveCarDatePicer> {
  FixedExtentScrollController scrollCon =  FixedExtentScrollController();
  int idxs = 0;
  List<String> provinces = ["鲁", "赣", "黑", "京"];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() async {
        await showCupertinoModalPopup<void>(
          context: context,
          builder:(BuildContext context) {
            return CupertinoPicker(
      scrollController: scrollCon,
      itemExtent: 30,
      backgroundColor: Colors.white,
      useMagnifier:true,
      onSelectedItemChanged: (int idx) {
        setState((){
          idxs = idx;
        });
      },
      children: List<Widget>.generate(provinces.length, (int idx){
        return Center(
          child: Text(
            provinces[idx],
          ),
          );
      }),
    );
          }
        );
      },
      child:Text(
        provinces[idxs],
        style:TextStyle(
          color:CupertinoColors.inactiveGray,
        ),
      ),
    );
  }
}