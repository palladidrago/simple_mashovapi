import 'package:simple_mashovapi/simple_mashovapi.dart';

void main() async {
  var controller = Controller();
  await controller.login('', r'', '540484', '2021');
  var grades = await controller.getGradeList();
  for (var i = 0; i < grades.length; i++) {
    print(
        '${grades[i].grade} ${grades[i].subjectName}\u{200E}${grades[i].eventDate} ${grades[i].gradeType} id:${grades[i].id}');
  }
}
