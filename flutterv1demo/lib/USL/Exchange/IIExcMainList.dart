import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterv1demo/Model/IIExcMODELS/IIExcMainListModel.dart';
import 'package:flutterv1demo/BLL/IIExc/IIExcBLL.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// 邮箱的主要列表页面
/// 1.需要有下拉舒心 & 上拉加载
/// 
/// 
/// 

class IIExcMainList extends StatefulWidget {

  /// 标题
  String naviTitle = "";
  /// 数据源
  List<IIExcMainListModel> models = [];
  /// 文件夹id
  String folderid = "";
  /// 构造方法
  IIExcMainList(this.naviTitle, this.models, this.folderid);

  @override
  State<StatefulWidget> createState() {
    return IIExcMainListState();
  }

}

class IIExcMainListState extends State<IIExcMainList> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.naviTitle,),
        actions: [
          Container(
            width: 40,
            height: 30,
            child:FlatButton(
            padding: EdgeInsets.only(right: 0),
            child: Icon(Icons.email,color: Colors.white),
            onPressed: () {
              print('设置按钮被点击了');
              Fluttertoast.showToast(
              msg: '设置按钮被点击了',
              gravity: ToastGravity.CENTER,
              fontSize: 17,
              backgroundColor: Colors.grey,
              textColor: Colors.white,
              timeInSecForIos: 1,
              );
            },
            )
          ),
          Container(
            width: 60,
            height: 30,
            child:FlatButton(
            padding: EdgeInsets.only(right: 0),
            child: Icon(Icons.settings,color: Colors.white),
            onPressed: () {
              print('设置按钮被点击了');
              Fluttertoast.showToast(
              msg: '设置按钮被点击了',
              gravity: ToastGravity.CENTER,
              fontSize: 17,
              backgroundColor: Colors.grey,
              textColor: Colors.white,
              timeInSecForIos: 1,
            );
            },
            )
          ),
        ],
      ),
      body: ListView.separated(
        itemCount:widget.models.length,
        separatorBuilder: (context, index) => Divider(height: .0),
        itemBuilder: (BuildContext context, int index){
          if ((widget.models.length - 1) == index) {
            //需要去加载新的数据void
            getMoreData();
            return Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: CircularProgressIndicator(strokeWidth: 2.0)
              ),
            );
          }
          return Container(
            height: 85,
            child: Stack(
            alignment: Alignment.center,
            children: <Widget> [
              //主题
              Positioned(
                top: 10,
                left: 16,
                child: Text(
                  widget.models[index].displaySender,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis
                ),
              ),
              //摘要
              Positioned(
                top: 35,
                left: 16,
                width: MediaQuery.of(context).size.width - 112,
                child: Text(
                  widget.models[index].subject,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                  maxLines: 2,
                  //overflow: TextOverflow.ellipsis
                ),
              ),
              //发送时间
              Positioned(
                right: 12,
                width: 80,
                top: 34,
                child: Text(
                  widget.models[index].getRealDate(),
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                )
              ),
              // 是否加密
              Positioned(
                right: 12,
                top: 11,
                width: widget.models[index].isEncrypted ? 12 : 0,
                height: 14,
                child: Image(
                  image: AssetImage('images/iiexc_security_lock.png'),
                )
              ),
            ],
          ),
          );
        },
      ),
    );
    //return null;
  }

  /// 加载更多数据
  Future<void> getMoreData() async {
    List<IIExcMainListModel> models = await IIExcBll().getListByPageNum(widget.folderid, 20, widget.models.length - 1);
    widget.models.addAll(models);
    setState((){
      //重新构建列表
    });
  }

}