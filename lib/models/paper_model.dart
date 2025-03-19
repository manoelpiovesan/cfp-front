///
///
///
class PaperModel {
  String title = '';
  String summary = '';
  String author = '';
  String email = '';
  DateTime submittedAt = DateTime.now();

  ///
  ///
  ///
  PaperModel();

  ///
  ///
  ///
  PaperModel.fromJson(final Map<String, dynamic> map) {
    title = map['title'] ?? '';
    summary = map['summary'] ?? '';
    author = map['author'] ?? '';
    email = map['email'] ?? '';
    submittedAt =
        DateTime.parse(map['submittedAt'] ?? DateTime.now().toString());
  }

  ///
  ///
  ///
  Map<String, dynamic> toMap() {
    return <String, String>{
      'title': title,
      'summary': summary,
      'author': author,
      'email': email,
    };
  }
}
