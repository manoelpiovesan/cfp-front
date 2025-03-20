///
///
///
class UserModel {
  String firstName = '';
  String lastName = '';
  String username = '';
  String email = '';
  String password = '';

  ///
  ///
  ///
  UserModel();

  ///
  ///
  ///
  UserModel.fromJson(final Map<String, dynamic> map) {
    username = map['username'] ?? '';
    firstName = map['firstName'] ?? '';
    lastName = map['lastName'] ?? '';
    email = map['email'] ?? '';
    password = map['password'] ?? '';
  }

  ///
  ///
  ///
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
    };
  }
}
