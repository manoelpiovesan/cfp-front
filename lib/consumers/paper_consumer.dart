import 'dart:convert';

import 'package:cfp_front/models/paper_model.dart';
import 'package:cfp_front/utils/config.dart';
import 'package:http/http.dart' as http;

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
}
