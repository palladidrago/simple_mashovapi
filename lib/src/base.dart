import 'package:dio/dio.dart';
import 'dart:convert';
//Gets the basic stuff needed to log into the mashov
class Base {
  Dio dio = Dio();
  String username;
  String password;
  String semel;
  String year;
  static var login;

  dynamic getPayload()  => {
      'username': username,
      'password': password,
      'semel': semel,
      'year': year
  };
  dynamic log() async {
    var data = await getPayload();
    return await dio.post('https://web.mashov.info/api/login',
        data: data);
  }

  Base(this.username, this.password, this.semel, this.year){login = log();}

  Future<String> getCookie() async {
    var loginComplete = await login;
    return loginComplete.headers['Set-Cookie'].toString();
  }

  Future<String> getToken() async {
    var loginComplete = await login;
    return loginComplete.headers['x-csrf-token'].toString();
  }
  Future<String> getUserId() async{
    var loginComplete = await login;
    dynamic map = json.decode(json.encode(loginComplete.data));
    return map['credential']['userId'].toString();
  }
  Future<Map<String, String>> getHeaders(String method) async {
    return await {
      "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:83.0) Gecko/20100101 Firefox/83.0",
      "Host": "web.mashov.info",
      "Referer": "https://web.mashov.info/students/main/students/1d717f68-26a1-4bc2-8a9e-b0e9c17aeb88/regularGrades",
      'x-csrf-token': await getToken(),
      'cookie': await getCookie()
    };
  }
}
