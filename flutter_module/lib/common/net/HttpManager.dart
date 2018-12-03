import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart';
import 'ResultData.dart';
import 'Code.dart';
import 'dart:collection';

///请求管理类
class HttpManager {
  static const CONTENT_TYPE_JSON = "application/json";
  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";
  static Map optionParams = {
    "timeoutMs": 15000,
    "token": null,
    "authorizationCode": null,
  };

  /*
  * url 请求url,
  * params 请求参数
  * header 请求头
  * option 配置
  * 
  */
  static netFetch(url, params, Map<String, String> header, Options option,
      {noTip = false}) async {
    var connectvityResult = await (new Connectivity().checkConnectivity());

    ///没有网络
    if (connectvityResult == ConnectivityResult.none) {
      return new ResultData(
        Code.errorHandleFunction(Code.NETWORK_ERROR, "", noTip),
        false,
        Code.NETWORK_ERROR,
      );
    }

    Map<String, String> headers = new HashMap();
    if (header != null) {
      header.addAll(header);
    }
  }
}
