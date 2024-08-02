// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  String firstName;
  String lastName;
  String phone;
  String username;
  String birthDate;
  String password;
  String confirmPassword;
  UserModel({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.username,
    required this.birthDate,
    required this.password,
    required this.confirmPassword,
  });

  toMap() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "phone": phone,
      "username": username,
      "birthDate": birthDate,
      "password": password,
      "confirmPassword": confirmPassword
    };
  }
}
