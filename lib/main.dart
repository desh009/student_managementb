abstract class role {
  void displayRole();
}

class Person implements role {
  String name;
  int age;
  String address;

  Person(this.name, this.age, this.address);

  String get getName => name;
  int get getAge => age;
  String get getAddress => address;
  @override
  void displayRole() {
    print('$name\'s role is missing. Please try another.');
  }

  void displaydetails() {
    print('Name :$name');
    print('Age: age');
    print('Adress: $address');
  }
}

class Student extends Person {
  String studentID;
  String grade;
  List<double> courseScores;
  Student(
    String name,
    int age,
    String adress,
    this.studentID,
    this.grade,
    this.courseScores,
  ) : super(name, age, adress);
  @override
  void displayRole() {
    print('Role: Student');
  }

  double calculateAverageScore() {
    if (courseScores.isEmpty) {
      return 0.0;
    }
    double totalScore = courseScores.reduce((a, b) => a + b);
    return totalScore / courseScores.length;
  }

  @override
  void displaydetails() {
    super.displaydetails();

    print('Average Score: ${calculateAverageScore().toStringAsFixed(2)}');
  }
}

class Teacher extends Person {
  String teacherID;
  List<String> coursesTaught;

  Teacher(
    String name,
    int age,
    String address,
    this.teacherID,
    this.coursesTaught,
  ) : super(name, age, address);

  @override
  void displayRole() {
    print('Role: Teacher');
  }

  void displayCourses() {
    if (coursesTaught.isEmpty) {
      print('No courses taught yet.');
    } else {
      print('Courses Taught:');
      for (String course in coursesTaught) {
        print('- $course');
      }
    }
  }

  @override
  void displaydetails() {
    super.displaydetails();
    displayCourses();
  }
}

class StudentManagementSystem {
  static void main() {
    Student student = Student(
      'John Doe',
      20,
      '123 Main St',
      'S101',
      'A',
      [90.0, 85.0, 82.0],
    );

    Teacher teacher = Teacher(
      'Mrs Smith',
      35,
      '456 Oak St',
      'T202',
      ['Math', 'English', 'Bangla'],
    );

    print('Student Information:');
    student.displayRole();
    student.displaydetails();
    print('object');

    print('Teacher Information');
    teacher.displayRole();
    teacher.displaydetails();
  }
}

void main() {
  StudentManagementSystem();
}
