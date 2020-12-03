class Grade {
  int grade; //Actual grade
  int id; //Grade id
  String subjectName, teacherName, groupName; //Subect name ,teacher name, Group(Hakbatsa) name
  String eventDate; //Test date i  assume
  String gradingEvent, gradeType; //gradingEvent: מבחן1 gradeType: Test, etc

  Grade(
      {this.id,
      this.grade,
      this.subjectName,
      this.eventDate,
      this.gradeType,
      this.teacherName,
      this.groupName,
      this.gradingEvent});
}
/*
{
"grade":100
"teacherName":"וסרניס אירינה",
"groupName":"מתמטיקה 5 י1-י2",
"subjectName":"מתמטיקה",
"eventDate":"2019-09-02T00:00:00",
"gradingEvent":"מבחן 1",
"gradeType":"*מבחן"}
*/
