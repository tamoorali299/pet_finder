class UserModel {
  final String id;
  final String email;
  final String? token;
  final String? name;
  final String? petCategory;

  UserModel({required this.id, required this.email, this.token, this.name, this.petCategory});

  // Optional: Add fromJson/toJson if using serialization
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      token: json['token'],
      name: json['name'],
      petCategory: json['petCategory'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'token': token,
      'name': name,
      'petCategory': petCategory,
    };
  }
}