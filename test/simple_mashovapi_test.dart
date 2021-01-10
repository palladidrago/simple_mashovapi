import 'package:simple_mashovapi/simple_mashovapi.dart';

void main(List<String> args) async {
  var controller = Controller();
  await controller.login(args[0],args[1], '540484', '2021');
  var name = await controller.getName();
  print(name.firstName);
  }
 