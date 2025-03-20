import 'dart:convert';

import 'package:cfp_front/models/paper_model.dart';
import 'package:cfp_front/utils/config.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

///
///
///
class PaperConsumer {
  ///
  ///
  ///
  Future<List<PaperModel>?> listAll(
    final String? term,
    final int page,
    final int size,
  ) async {
    final Uri url =
        Uri.parse(<String>[Config().baseUrl, 'paper'].join('/')).replace(
      queryParameters: <String, String>{
        if (term != null) 'term': term,
        'page': page.toString(),
        'size': size.toString(),
      },
    );

    final http.Response response = await http.get(url);

    if (response.statusCode > 199 && response.statusCode < 300) {
      final List<dynamic> body = json.decode(response.body);
      return body
          .map((final dynamic item) => PaperModel.fromJson(item))
          .toList();
    }

    throw Exception('Failed to load papers');
  }

  ///
  ///
  /// POST
  Future<bool> create(final PaperModel paper) async {
    final Uri url = Uri.parse(<String>[Config().baseUrl, 'paper'].join('/'));
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    if(token == null) {
      return false;
    }

    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, String>{
        'title': paper.title,
        'summary': paper.summary,
      }),
    );

    if (response.statusCode > 199 && response.statusCode < 300) {
      return true;
    }

    return false;
  }
}
