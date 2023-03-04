class UserDto {
  final String userName;
  final String email;
  final String password;

  UserDto({
    required this.userName,
    required this.email,
    required this.password,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      userName: json['userName'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() => {
        'userName': userName,
        'email': email,
        'password': password,
      };
}