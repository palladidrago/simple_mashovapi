import 'package:dio/dio.dart';
import 'dart:convert';

//Gets the basic stuff needed to utilize the mashov api.
class Base {
  Dio dio = Dio();
  String username;
  String password;
  String semel;
  String year;
  static var login;

  dynamic log() async {
    var data = {
      'username': username,
      'password': password,
      'semel': semel,
      'year': year
    };
    return await dio.post('https://web.mashov.info/api/login', data: data);
  }

  Base(this.username, this.password, this.semel, this.year) {
    login = log();
  }

  Future<String> getUserId() async {
    //Get the user id from the login response
    var loginComplete = await login;
    dynamic map = json.decode(json.encode(loginComplete.data));
    return map['credential']['userId'].toString();
  }

  Future<Map<String, String>> getHeaders() async {
    //Return the headers needed to log in.
    var loginComplete = await login;
    var xcrsftoken = loginComplete.headers['x-csrf-token'][0];
    var cookie = loginComplete.headers['Set-Cookie'].toString();
    return await {'x-csrf-token': xcrsftoken, 'cookie': cookie};
  }
}
