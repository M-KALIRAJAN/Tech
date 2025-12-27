class AuthModel {
  final String email;
  final String password;

  AuthModel({
    required this.email,
    required this.password,
  });

  //Dart to => JSON
  Map<String,dynamic>toJson(){
 return{
  "email":email,
  "password":password
 };
  }
}