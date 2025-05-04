class User {
  final String id;
  final String email;
  final String? token;
  final String? name;

  User({required this.id, required this.email, this.token, this.name,});
}