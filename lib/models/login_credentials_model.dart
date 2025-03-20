///
///
///
class LoginCredentials {
  String email = '';
  String password = '';

  ///
  ///
  ///
  LoginCredentials();

  ///
  ///
  ///
  LoginCredentials.fromJson(final Map<String, dynamic> map) {
    email = map['email'] ?? '';
    password = map['password'] ?? '';
  }

  ///
  ///
  ///
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }
}
