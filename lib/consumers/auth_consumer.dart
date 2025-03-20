import 'dart:convert';

import 'package:cfp_front/models/login_credentials_model.dart';
import 'package:cfp_front/models/user_model.dart';
import 'package:cfp_front/utils/config.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

///
///
///
class AuthConsumer {
  ///
  ///
  ///
  Future<bool> login(final LoginCredentials credentials) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final Uri url =
        Uri.parse(<String>[Config().baseUrl, 'auth', 'login'].join('/'));

    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(credentials.toMap()),
    );

    if (response.statusCode == 200) {
      await prefs.setString('token', response.body);
      await prefs.setString('email', credentials.email);
      await prefs.setString('password', credentials.password);
      return true;
    }

    return false;
  }

  ///
  ///
  ///
  Future<bool> register(final UserModel user) async {
    final Uri url =
        Uri.parse(<String>[Config().baseUrl, 'auth', 'register'].join('/'));

    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(user.toMap()),
    );

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }
}
