class UserModel {
  final String username;
  final String email;
  final String userId;

  UserModel({
    required this.userId,
    required this.username,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
      userId: data['userId'],
      email: data['email'],
      username: data['username'],
    );
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'username': username,
      };
}
