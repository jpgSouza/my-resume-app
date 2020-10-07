import 'dart:io';

import 'package:my_resume_app/src/model/entities/course_model.dart';
import 'package:my_resume_app/src/model/entities/skill_model.dart';

class Resume {
  File profilePic;
  String title;
  String fullName;
  String phone;
  String email;
  Skill skill;
  Course course;

  Resume(this.title, this.fullName, this.phone, this.email, this.skill,
      this.course);

  Resume.def();

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'fullName': fullName,
      'phone': phone,
      'email': email,
      'skill': skill.toMap(),
      'course': course.toMap()
    };
  }
}
