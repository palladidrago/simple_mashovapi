import 'package:simple_mashovapi/src/base.dart';
import 'package:simple_mashovapi/src/models.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

//Wrapper around the various api calls.
class Controller {
  //Utilities for the Mashov api
  Dio dio = Dio();
  static String userId;
  Base base;
  String studentUrl, userUrl;
  Future<void> login(String username, String password, String semel, String year) async {
    //Login into the mashov
    base = await Base(username, password, semel, year); // Creates a Base instance.
    userId = await base.getUserId(); 
    dio.options.headers = await base.getHeaders();
    studentUrl = 'https://web.mashov.info/api/students/${userId}/';
    userUrl = 'https://web.mashov.info/api/user/${userId}/';
  }

  Future<List<dynamic>> _getGradesRaw() async {
    //Returns a list of grades, in raw "json" (It's actually a map<string,dynamic).DONT USE
    var response = await dio.get('${studentUrl}grades');
    return response.data;
  }

  Future<List<Grade>> getGradeList() async {
    //Returns the grade list, as a list of Grade objects.
    var gradesRaw = await _getGradesRaw(); // 
    var grades = List<Grade>(gradesRaw.length); //Empty grade list
    var gradeRaw; //Raw grade.
    
    for (var i = 0; i < gradesRaw.length; i++) {
      //Goes through all the grades, sets up each Grade 
      gradeRaw = gradesRaw[i];
      grades[i] = Grade(
          grade: gradeRaw['grade'],
          subjectName: gradeRaw['subjectName'],
          eventDate: gradeRaw['eventDate'].substring(0, 10),
          gradeType: gradeRaw['gradeType'],
          teacherName: gradeRaw['teacherName'],
          groupName: gradeRaw['groupName'],
          gradingEvent: gradeRaw['gradingEvent'],
          id: gradeRaw['id']
          );
    }
    return grades;
  }

  Future<Name> getName() async{
    var login  = await base.getLogin();
    Map<String,dynamic> fullName = json.decode(json.encode(login.data))['accessToken']['children'][0];
    return Name(fullName['privateName'],fullName['familyName']);
  }
}
