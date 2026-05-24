void main() {
  //  No return type (void)
  // Without parameter
  void greet() {
    print("Welcome to our application");
  }

  // Calling
  greet();

  // With parameter
  void greetUser(String name) {
    print("Welcome, ${name}");
  }

  // Calling with parameter
  greetUser("Aneesa");

  // Return type (int)
  int add(int a, int b) {
    return a + b;
  }

  // Calling
  int res = add(3, 4);
  print(res);
}
