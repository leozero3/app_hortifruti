class UserModel {
  String name;
  String email;
  String phone;
  UserModel({required this.name, required this.email, required this.phone});

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      name: map['nome'],
      email: map['email'],
      phone: map['telefone'],
    );
  }
}
