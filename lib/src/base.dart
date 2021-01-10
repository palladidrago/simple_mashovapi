import 'package:dio/dio.dart';
import 'dart:convert';

//Gets the basic stuff needed to utilize the mashov api.
class Base {
  Dio dio = Dio();
  String username; //username
  String password; //password
  String semel; //semel(school identifier)
  String year; //school year(this year is 2021)
  var login; //login response, contains cookie, xcsrf token, user id and a bunch of other stuff

  dynamic log() async {
    //Logs into the mashov
    var data = {
      'username': username,
      'password': password,
      'semel': semel,
      'year': year
    };
    return await dio.post('https://web.mashov.info/api/login', data: data);
  }

  Base(this.username, this.password, this.semel, this.year) {
    //Constructor for mashovapi base.
    login = log();
  }
  Future<dynamic> getLogin() async{
    return await login;
  }

  Future<String> getUserId() async {
    //Get the user id from the login response
    var loginComplete = await login;
    Map<String,dynamic> map = json.decode(json.encode(loginComplete.data));
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
