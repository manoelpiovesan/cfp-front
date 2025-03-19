///
///
///
class Session {
  String? email;
  String? password;
  String? token;


  ///
  ///
  ///
  void clear() {
    email = null;
    password = null;
    token = null;
  }

  /// Singleton factory
  factory Session() => _instance;

  Session._privateConstructor();

  static final Session _instance = Session._privateConstructor();
}
