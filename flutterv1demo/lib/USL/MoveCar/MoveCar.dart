import 'package:flutter/material.dart';
import 'package:flutterv1demo/BLL/MoveCar/MoveCarBLL.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterv1demo/USL/MoveCar/IIPicker.dart';
import 'package:flutterv1demo/Model/MoveCar/MoveCarModel.dart';
import 'package:flutterv1demo/USL/MoveCar/IIMoveCarList.dart';
import 'package:url_launcher/url_launcher.dart';

/// 挪车功能主页面
class MoveCar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MoveCarState();
  }
}

class MoveCarState extends State<MoveCar> {
  /// 获取输入框位置key
  GlobalKey _key = GlobalKey();

  /// 城市信息
  List<dynamic> cityInfos = [
    ['A']
  ];

  /// 省信息
  List<String> provinces = ['鲁'];

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

  /// 需要展示的车信息model
  MoveCarModel selectedCarModel;

  /// 搜索按钮显示文案
  String searchBtnShowInfo = '请输入';

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
      body: ListView(
        children: <Widget>[
          Container(
            width:double.infinity,
            height: MediaQuery.of(context).size.height - kToolbarHeight - MediaQuery.of(context).padding.top,
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
                  margin:
                      EdgeInsets.only(top: 50, left: leftDis, right: leftDis),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  height: 50,
                  child: TextField(
                    key: _key,
                    controller: carNoCon,
                    focusNode: node,
                    autofocus: true,
                    onChanged: (txtInfo) async {
                      if (txtInfo.length == 0) {
                        this.clearSelectedInfo();
                        return;
                      }
                      List<MoveCarModel> lists =
                          await this.selectInfos(txtInfo);
                      if (lists.length == 0) {
                        return;
                      }
                      IIMoveCarList menu =
                          IIMoveCarList(lists, this.getTxtfdRect());
                      menu.callBackAction = (carModel) {
                        this.setCarNoAndSHowBotInfo(carModel);
                      };
                      await menu.showCarInfos(context);
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "填写尾号搜索...",
                      //输入框前面的 鲁 A 按钮
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
                                    IIPicker pick = IIPicker(
                                        this.cityInfos, this.provinces);
                                    pick.backAction = (provinceIdx, cityIdx) {
                                      this.provinceSelectidx = provinceIdx;
                                      this.citySelectidx = cityIdx;
                                      setState(() {});
                                    };
                                    return pick;
                                  });
                            },
                            child: Text(
                                this.getShowStrInfo(
                                    this.provinceSelectidx, this.citySelectidx),
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
                          clearSelectedInfo();
                        },
                      ),
                    ),
                  ),
                ),
                //搜索 & 联系按钮
                Container(
                  width: MediaQuery.of(context).size.width - leftDis * 2,
                  height: 40,
                  margin:
                      EdgeInsets.only(left: leftDis, right: leftDis, top: 40),
                  child: FlatButton(
                      color: Colors.blue,
                      onPressed: () {
                        this.callSomePerson();
                      },
                      child: Text(
                        this.searchBtnShowInfo,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      )),
                ),
                //车型
                Container(
                  alignment: Alignment.bottomLeft,
                  margin:
                      EdgeInsets.only(left: leftDis, right: leftDis, top: 40),
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    '车型' +
                        ((null == this.selectedCarModel)
                            ? ''
                            : ' : ' + this.selectedCarModel.carBrand),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                //颜色
                Container(
                  alignment: Alignment.bottomLeft,
                  margin:
                      EdgeInsets.only(left: leftDis, right: leftDis, top: 40),
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    '颜色' +
                        ((null == this.selectedCarModel)
                            ? ''
                            : ' : ' + this.selectedCarModel.carColor),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                //车主
                Container(
                  alignment: Alignment.bottomLeft,
                  margin:
                      EdgeInsets.only(left: leftDis, right: leftDis, top: 40),
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    '车主' +
                        ((null == this.selectedCarModel)
                            ? ''
                            : ' : ' + this.selectedCarModel.carOwner),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 获取应该显示的信息 - 鲁 A
  String getShowStrInfo(int provinceIdx, int cityIdx) {
    return this.provinces[provinceIdx].toString() +
        ' ' +
        this.cityInfos[provinceIdx][cityIdx].toString();
  }

  /// 选择车辆信息
  Future<List<MoveCarModel>> selectInfos(String carNo) async {
    if (carNo.length < 3) {
      return [];
    }
    List<MoveCarModel> infos = await this.bll.selectByProvinces(
        this.provinces[provinceSelectidx].toString(),
        this.cityInfos[provinceSelectidx][citySelectidx],
        carNo);
    return infos;
  }

  /// 设置选择车辆后设置显示信息
  void setCarNoAndSHowBotInfo(MoveCarModel model) {
    this.selectedCarModel = model;
    searchBtnShowInfo = '联系TA';
    carNoCon = TextEditingController(text: model.id.number);
    this.provinceSelectidx = bll.getRealProvinceIdx(this.provinces, model.id.province);
    this.citySelectidx = bll.getRealProvinceIdx((this.cityInfos[provinceSelectidx]), model.id.city);
    setState(() {});
  }

  /// 清空选中的信息
  void clearSelectedInfo() {
    this.selectedCarModel = null;
    searchBtnShowInfo = '请输入';
    setState(() {});
  }

  /// 拨打电话
  void callSomePerson() async {
    if (null == this.selectedCarModel) {
      return;
    }
    String url = 'tel:' + this.selectedCarModel.ownerPhone;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  /// 获取textfield位置 和 size
  double getTxtfdRect() {
    //获取position
    RenderBox box = _key.currentContext.findRenderObject();
    Offset offset = box.localToGlobal(Offset.zero);
    print(offset);
    //获取size
    Size size = box.size;
    print(size);
    return size.height + offset.dy;
  }
}
