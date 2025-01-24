class UserModel {
  final int id;
  final String? name;
  final String email;
  final String password;

  UserModel({
    required this.id,
    this.name,
    required this.email,
    required this.password,
  });
}
