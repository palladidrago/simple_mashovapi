import 'package:simple_mashovapi/simple_mashovapi.dart';

void main(List<String> args) async {
  var controller = Controller();
  await controller.login(args[0],args[1], '540484', '2021');
  var grades = await controller.getGradeList();
  for (int i = 0;i<grades.length;i++){
    print("${grades[i].grade} ${grades[i].gradingEvent}");
  }
  }
 