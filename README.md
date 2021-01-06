A mashov library in dart, So far only returns a list of grades.

## Usage

A simple usage example:

```dart
import 'package:simple_mashovapi/simple_mashovapi.dart';

main() {
  var controller = Controller();
  await controller.login("username", "password" , "semel", "year");
  var grades = await controller.getGradeList(); //Returns list of Grades
  print(grades[1].grade);
}
```
 ## Todo 
 * Mashov Moodle integration.
 * Return bagrut grades.
 * Get the mail.
 * List of features to implement.
 * Use only 1 http client.
