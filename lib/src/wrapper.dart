import 'package:mashovapi/src/base.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//Wrapper around the various api calls.
class Utils {
  static String userId;
  Base base; 
  String studentUrl, userUrl;
  Future<void> login(String username, String password, String semel, String year) async{
    base = await Base(username,password,semel,year);
    userId = await base.getUserId();
    studentUrl = 'https://web.mashov.info/api/students/${userId}/';
    userUrl = 'https://web.mashov.info/api/user/${userId}/';
  }
  dynamic getGrades() async{  
    var headers = await base.getHeaders('GET');
    print(headers);
    var response = await http.get('https://web.mashov.info/api/students/${userId}/grades',headers:headers);
    print('\n'+response.statusCode.toString());
  }

}
