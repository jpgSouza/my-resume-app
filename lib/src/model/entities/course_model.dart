class Course {
  String title;
  String date;
  String institute;

  Course(this.title, this.date, this.institute);

  Map<String, dynamic> toMap() {
    return {'title': title, 'date': date, 'institute': institute};
  }
}
