import 'package:flutter_test/flutter_test.dart';
import 'package:my_resume_app/src/model/entities/course_model.dart';
import 'package:my_resume_app/src/model/entities/resume_model.dart';
import 'package:my_resume_app/src/model/entities/skill_model.dart';
import 'package:my_resume_app/src/model/entities/user_model.dart';

void main() {
  Resume resume = new Resume(
      'Leucotron - CV',
      'Joao Pedro',
      '123456',
      'joao@gmail.com',
      new Skill('Java', 'Spring boot'),
      new Course('Java 2020', '20/12/2019', 'Udemy'));
  group("Test resume map", () {
    test("title", () {
      Map<String, dynamic> resumeData = Map();
      resumeData = resume.toMap();
      expect(resumeData['title'], 'Leucotron - CV');
    });

    test("full name", () {
      Map<String, dynamic> resumeData = Map();
      resumeData = resume.toMap();
      expect(resumeData['fullName'], 'Joao Pedro');
    });

    test("phone number", () {
      Map<String, dynamic> resumeData = Map();
      resumeData = resume.toMap();
      expect(resumeData['phone'], '123456');
    });

    test("skill", () {
      Map<String, dynamic> resumeData = Map();
      resumeData = resume.toMap();
      expect(
          resumeData['skill'], {'title': 'Java', 'description': 'Spring boot'});
    });

    test("course", () {
      Map<String, dynamic> resumeData = Map();
      resumeData = resume.toMap();
      expect(resumeData['course'],
          {'title': 'Java 2020', 'date': '20/12/2019', 'institute': 'Udemy'});
    });
  });
}
