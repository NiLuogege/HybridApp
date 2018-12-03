///地址数据
class Address {
  static const String host = "https://api.github.com/";

  ///用户收到的事件信息 get
  static getEventReceived(userName) {
    return "${host}user/$userName/received_events";
  }
}
