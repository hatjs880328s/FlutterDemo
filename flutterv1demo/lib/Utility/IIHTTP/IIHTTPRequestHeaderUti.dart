// HTTP请求的header & parmas
class IIHTTPRequestHeaderUti {

  /// 获取普通header
  Map<String,String> getHttpHeader() {
    Map header = Map();
    header['token'] = 'sdafasdf';
    return header;
  }

  /// 获取普通params
  Map<String,String> getHttpParams() {
    Map header = Map();
    header['token'] = 'sdafasdf';
    return header;
  }
  
  /// 获取请求token的header
  Map<String,dynamic> getRequestTokenHeader() {
    Map<String,dynamic> header = Map();
    header['Content-Type'] = 'application/x-www-form-urlencoded';
    return header;
  }

  /// 获取请求token的参数
  Map<String,String> getRequestTokenParams(String userName, String password, String id, String secret) {
    Map<String,String> header = Map();
    header['grant_type'] = 'password';
    header['scope'] = '';
    header['client_id'] = id;
    header['client_secret'] = secret;
    header['username'] = userName;
    header['password'] = password;
    return header;
  }
}