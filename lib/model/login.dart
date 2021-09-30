class Login {
  final String id;
  final String pass;


  Login({required this.id, required this.pass});

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      id: json['id'],
      pass: json['title'],
    );
  }
}
