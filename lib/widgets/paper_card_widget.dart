import 'package:cfp_front/models/paper_model.dart';
import 'package:flutter/material.dart';

///
///
///
class PaperCardWidget extends StatelessWidget {
  final PaperModel paper;

  const PaperCardWidget(this.paper, {super.key});

  ///
  ///
  ///
  @override
  Widget build(final BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              spacing: 8,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  paper.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  paper.summary,
                  style: const TextStyle(
                    fontSize: 14,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 4,
                ),
              ],
            ),

            /// Author
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                /// Author
                Row(
                  spacing: 8,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      foregroundColor: Colors.white,
                      child: Text(
                        paper.author[0],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          paper.author,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          paper.email,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                /// Submitted At
                Text(
                  prettyDate(paper.submittedAt),
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  ///
  ///
  ///
  String prettyDate(final DateTime date) {
    final Duration diff = DateTime.now().difference(date);
    if (diff.inMinutes < 60) {
      return '${diff.inMinutes} min';
    } else if (diff.inHours < 24) {
      return '${diff.inHours} h';
    } else if (diff.inDays < 30) {
      return '${diff.inDays} dias';
    } else if (diff.inDays < 365) {
      return '${date.day}/${date.month}';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
}
