class SignupRequest {
  final String title;
  final String message;
  final String name;
  final int stateCode;

  SignupRequest({ required this.title, required this.message, required this.stateCode, required this.name});
}

class SignupResponse {
  final String title;
  final String message;
  final int stateCode;

  SignupResponse({ required this.title, required this.message, required this.stateCode});

  factory SignupResponse.fromJson(Map<dynamic,dynamic> json) {
    return SignupResponse(
      title: json['title'],
      message: json['message'],
      stateCode: json['stateCode'],
    );
  }
}
