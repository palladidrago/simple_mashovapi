A mashov library in dart, So far only returns a list of grades.

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
 ## Todo 
 * Mashov Moodle integration.
 * Return bagrut grades.
 * Get the mail.
 * List of features to implement.
 * Use only 1 http client.
