class UserLoginRequestModel {
  String email;
  String password;
  UserLoginRequestModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory UserLoginRequestModel.fromMap(Map<String, dynamic> map) {
    return UserLoginRequestModel(
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }
}
