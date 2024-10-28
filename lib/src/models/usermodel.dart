class UserModel{
  final String userId;
  final String name;
  final String email;
  final String password;

  UserModel({
    required this.userId,
    required this.name,
    required this.email,
    required this.password
  });

  Map<String,dynamic> toJson(){
    return{
      "userId":userId,
      "name":name,
      "email":email,
      "password":password
    };
  }
}