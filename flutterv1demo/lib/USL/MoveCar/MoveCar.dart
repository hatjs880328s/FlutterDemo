import 'package:flutter/material.dart';
import 'package:flutterv1demo/BLL/MoveCar/MoveCarBLL.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterv1demo/USL/MoveCar/IIPicker.dart';

/// 挪车功能主页面
class MoveCar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MoveCarState();
  }
}

class MoveCarState extends State<MoveCar> {
  /// 城市信息
  List<dynamic> cityInfos;

  /// 省信息
  List<String> provinces;

  /// 网络获取的大数据结构
  List<dynamic> bigInfos;

  @override
  initState() {
    super.initState();
  }

  MoveCarBll bll = MoveCarBll();

  /// 汽车排号con
  TextEditingController carNoCon = TextEditingController(text: '');

  FocusNode node = FocusNode();

  FocusScopeNode focusScopeNode;

  double leftDis = 35;

  /// 省 选择的idx
  int provinceSelectidx = 0;

  /// 市 选择的idx
  int citySelectidx = 0;

    /// 获取网络数据并处理
  getDate() async {
    this.bigInfos = await bll.getProvinces();
    this.cityInfos = bll.progressCity(this.bigInfos);
    this.provinces = bll.progressProvinces(this.bigInfos);
  }

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(node);
    return Scaffold(
      appBar: AppBar(
        title: Text('挪车'),
        actions: [
          Container(
              margin: EdgeInsets.only(right: 10),
              width: 40,
              height: 30,
              child: FlatButton(
                padding: EdgeInsets.only(right: 0),
                child: Icon(Icons.close, color: Colors.white),
                onPressed: () {
                  print('关闭当前页面');
                },
              )),
        ],
      ),
      body: Container(
        //容器背景
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/movecar_big_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          // 输入框
          children: <Widget>[
            //车牌输入
            Container(
              margin: EdgeInsets.only(top: 50, left: leftDis, right: leftDis),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: TextField(
                controller: carNoCon,
                focusNode: node,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "填写尾号搜索...",
                  prefixIcon: Container(
                      height: 25,
                      width: 80,
                      margin: EdgeInsets.only(
                          right: 10, left: 3, top: 3, bottom: 3),
                      child: FlatButton(
                        shape: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2)),
                        onPressed: () async {
                          await this.getDate();
                          await showCupertinoModalPopup<void>(
                              context: context,
                              builder: (BuildContext context) {
                                IIPicker pick = IIPicker(this.cityInfos, this.provinces);
                                pick.backAction = (provinceIdx, cityIdx) {
                                  this.provinceSelectidx =provinceIdx;
                                  this.citySelectidx =cityIdx;
                                  setState(() {

                                  });
                                };
                                return pick;
                              });
                        },
                        child: Text(
                            this.getShowStrInfo(this.provinceSelectidx, this.citySelectidx),
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 22,
                            )),
                      )),
                  //尾巴上的X
                  suffixIcon: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      carNoCon.clear();
                    },
                  ),
                ),
              ),
            ),
            //搜索 & 联系按钮
            Container(
              width: MediaQuery.of(context).size.width - leftDis * 2,
              height: 40,
              margin: EdgeInsets.only(left: leftDis, right: leftDis, top: 40),
              child: FlatButton(
                  color: Colors.blue,
                  onPressed: () {
                    //这里只是搜索选中后的联系事件
                    //print(scrollCon.selectedItem);
                  },
                  child: Text(
                    '请输入',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  )),
            ),
            //车型
            Container(
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.only(left: leftDis, right: leftDis, top: 40),
              padding: EdgeInsets.only(left: 20),
              child: Text(
                '车型',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            //颜色
            Container(
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.only(left: leftDis, right: leftDis, top: 40),
              padding: EdgeInsets.only(left: 20),
              child: Text(
                '颜色',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            //车主
            Container(
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.only(left: leftDis, right: leftDis, top: 40),
              padding: EdgeInsets.only(left: 20),
              child: Text(
                '车主',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 获取应该显示的 信息
  String getShowStrInfo(int provinceIdx, int cityIdx) {
    if (null == this.cityInfos) {
      return '鲁 A';
    }
    return this.provinces[provinceIdx].toString() + ' ' + this.cityInfos[provinceIdx][cityIdx].toString();
  }
}
