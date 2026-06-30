void main() {
  var name = "Zain";
  name = "Zain";
  // name = 18;
  print(name);
  dynamic a = "Aneesa";
  a = 9;
  print(a);

  // Simple If
  if (name == "Zain") {
    print("Verified User");
  }

  // Simple IF Else
  if (a >= 10) {
    print("a is greater then 10");
  } else {
    print("a is less then 10");
  }

  // Nested If
  var rEmail = "muhammadbinqasim@gmail.com";
  var rPass = "12345";
  var cPass = "12345";

  var lEmail = "muhammadbinqasim@gmail.com";
  var lPass = "1234";

  if (rPass == cPass) {
    if (lEmail == rEmail && lPass == rPass) {
      print("Welcome to our program!");
    } else {
      print("Invalid email or password!");
    }
  } else {
    print("Passwords doesn't match!");
  }

  // If Else Ladder
  double sub1 = 35;
  double sub2 = 90;
  double sub3 = 72;

  double obt = sub1 + sub2 + sub3;
  double totalMarks = 300;

  double per = (obt / totalMarks) * 100;

  String grade = "";

  if (per >= 90) {
    grade = "A+";
  } else if (per <= 89 && per >= 80) {
    grade = "A";
  } else if (per <= 79 && per >= 70) {
    grade = "B";
  } else if (per <= 69 && per >= 60) {
    grade = "C";
  } else if (per <= 59 && per >= 50) {
    grade = "D";
  } else {
    grade = "F";
  }

  print(
    "Name: ${name}, Subject 1: ${sub1}, Subject 2: ${sub2}, Subject 3: ${sub3}, Obtained Marks: ${obt} / ${totalMarks}, Percentage: ${per}, Grade: ${grade}",
  );
}
