library student;

class UserInfo {
  UserInfo({
    required this.idUser,
    required this.username,
    required this.customUsername,
    required this.email,
    required this.registerDate,
  });
  
  final String idUser;
  final String username;
  final String customUsername;
  final String email;
  final String registerDate;

  factory UserInfo.fromJson(Map<String, dynamic> json){
    return UserInfo(
      idUser: json['id_user'],
      username: json['username'],
      customUsername: json['custom_username'],
      email: json['email'],
      registerDate: json['register_date'].toString(),
    );
  }
}
