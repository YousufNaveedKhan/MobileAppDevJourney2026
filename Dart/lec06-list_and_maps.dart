void main() {
  List<dynamic> students = [
    "Zain Khan",
    "Muhammad bin Qasim",
    "Samar Hussain",
    "Aneesa",
    "Sajidah",
  ];

  print(students[2]);

  for (var student in students) {
    print(student);
  }

  Map<String, int> marks = {"eng": 44, "urdu": 87, "maths": 22};

  print(marks["eng"]);

  marks.forEach((key, value) {
    print("Subject: " + key + "\nMarks: " + value.toString());
  });
}