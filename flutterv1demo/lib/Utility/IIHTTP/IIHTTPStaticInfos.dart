
// HTTP请求的静态属性类
class IIHTTPStaticInfos {
  static String tokenID = "51c6a0a8-7a40-47e8-b8bd-cc305ece9c52";
  static String tokenSecret = "a4738cc3-f929-46d2-b4e5-277b6cac8e01";
  static String tokenUrl = "https://id.inspuronline.com/oauth2.0/token";
  static String iiexcLogin = "https://emm-inspur.inspuronline.com/api/ews/v1.0/UserProfile/MailBind";
  static String iiexcFolder = "https://emm-inspur.inspuronline.com/api/ews/v1.0/Folder";
  static String iiexcList = "https://emm-inspur.inspuronline.com/api/ews/v1.0/Mail/List";

  /// 挪车-获取省份信息请求地址
  static String moveCarProvince = "https://ecm.inspur.com/inspur_esg/api/v0/car/province";
  /// 挪车-查找api
  static String moveCarSelectInfosWithProvince = "https://ecm.inspur.com/inspur_esg/api/v0/car/platenumber?";
}