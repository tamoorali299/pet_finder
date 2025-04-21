class User {
  final String id;
  final String email;
  final String? token;
  final String? name;
  final String? petCategory;

  User({required this.id, required this.email, this.token, this.name, this.petCategory});
}