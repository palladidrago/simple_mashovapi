A mashov library in dart. Work in progress. 

## Usage

A simple usage example:

```dart
import 'package:mashovapi/mashovapi.dart';

main() {
  var Controller = Controller();
  await Controller.login("username", "password" , "semel", "year")
  grades = await Controller.getGradeList(); //Returns list of Grades
  print(grades[1]);
}
```
