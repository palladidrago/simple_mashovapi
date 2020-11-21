class Grade {
  int grade;
  String subjectName, teacherName, groupName;
  String eventDate;
  String gradingEvent, gradeType;

  Grade(
      {this.grade,
      this.subjectName,
      this.eventDate,
      this.gradeType,
      this.teacherName,
      this.groupName,
      this.gradingEvent});
}
/*
{
"gradingEventId":14,
"grade":100
,"timestamp":"2019-09-05T18:40:58",
"teacherName":"וסרניס אירינה","groupId":236,"groupName":"מתמטיקה 5 י1-י2",
"subjectName":"מתמטיקה","groupLevel":"5","eventDate":"2019-09-02T00:00:00",
"id":14,
"gradingEvent":"מבחן 1","gradeType":"*מבחן"}
*/
