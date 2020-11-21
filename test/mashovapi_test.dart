import 'package:mashovapi/mashovapi.dart';

void main() async {
  var controller = Controller();
  await controller.login('337945240', r'3h6Wc$t%OQPov1Ue@IG', '540484', '2021');
  await controller.getGradeList();
}
