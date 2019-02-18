import 'package:flutterv1demo/Utility/IIHTTP/IIHTTPRequestUti.dart';
import 'package:flutterv1demo/Utility/IIHTTP/IIHTTPRequestEnum.dart';
import 'package:flutterv1demo/Utility/IIHTTP/IIHTTPStaticInfos.dart';
import "package:flutterv1demo/Model/IIExcMODELS/IIExcFolderModel.dart";
import 'package:flutterv1demo/Model/IIExcMODELS/IIExcMainListModel.dart';
import 'package:flutterv1demo/Model/IIExcMODELS/IIExcBLLModel.dart';
// import 'dart:convert';
// import 'package:convert/convert.dart';
// import 'package:crypto/crypto.dart';


class IIExcBll {

  /// 登录操作 - 获取下来信息只需要第一个文件夹id [这里的密码强制使用处理过后的]
  Future<IIExcBLLModel> login(String name, String pwd) async {
    Map<String, dynamic> params = {"email": name, "password": "H6vZ+nfJV0Ins8hoDayCaA=="};
    String requestUrl = IIHTTPStaticInfos.iiexcLogin;
    await IIHTTPRequestUti().request(IIHTTPRequestEnum.post, params, requestUrl);
    //登录成功之后立马获取文件夹信息
    List<dynamic> mapInfo = await getFolders();
    List<IIExcFolderModel> models = [];
    for (int i = 0 ; i < mapInfo.length ; i++) {
      IIExcFolderModel model = IIExcFolderModel.fromJson(mapInfo[0]);
      models.add(model);
    }
    // 获取第一页数据
    List<IIExcMainListModel> resultList = await getListByPageNum(
      models.first.id,
      20,
      0
    );
    // 返回数据
    IIExcBLLModel resultModel = IIExcBLLModel();
    resultModel.models = resultList;
    resultModel.folderid = models.first.id;
    return resultModel;
  }

  /// 获取所有文件信息
  Future<List<dynamic>> getFolders() async {
    String requestURL = IIHTTPStaticInfos.iiexcFolder;
    try {
      List<dynamic> result = await IIHTTPRequestUti().request(IIHTTPRequestEnum.gEt, {}, requestURL);
      return result;
    }on Exception catch (e) {
      print(e);
      return null;
    }
  }

/// 分页获取数据
  Future<List<IIExcMainListModel>> getListByPageNum (
    String folderid,
    int pageSize,
    int pageOffset,
    ) async {

      String url = IIHTTPStaticInfos.iiexcList;
      Map<String, dynamic> params = {"folderId": folderid, "pageSize": pageSize, "offset": pageOffset};
      try  {
        List<dynamic> result = await IIHTTPRequestUti().request(IIHTTPRequestEnum.gEt, params, url);
        List<IIExcMainListModel> models = [];
        for (int i = 0 ; i < result.length ; i++) {
          IIExcMainListModel model = IIExcMainListModel.fromJson(result[i]);
          models.add(model);
        }
        return models;
      } on Exception {
        return null;
      }
  }
}