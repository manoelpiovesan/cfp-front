import 'package:cfp_front/models/paper_model.dart';
import 'package:cfp_front/consumers/paper_consumer.dart';
import 'package:cfp_front/views/widgets/paper_card_widget.dart';
import 'package:flutter/material.dart';

///
///
///
class PaperList extends StatefulWidget {
  const PaperList({super.key});

  @override
  State<PaperList> createState() => _PaperListState();
}

///
///
///
class _PaperListState extends State<PaperList> {
  int _page = 0;
  final int _pageSize = 10;
  String? _search;

  ///
  ///
  ///
  @override
  Widget build(final BuildContext context) {
    return FutureBuilder<List<PaperModel>?>(
      future: PaperConsumer().listAll(
        _search,
        _page,
        _pageSize,
      ),
      builder: (
        final BuildContext context,
        final AsyncSnapshot<List<PaperModel>?> snapshot,
      ) {
        /// On Waiting
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        /// On Error
        if (snapshot.hasError) {
          return Center(
            child: Text('Error ${snapshot.error}'),
          );
        }

        /// On Success
        if (snapshot.hasData) {
          return Column(
            children: <Widget>[
              /// Search
              Padding(
                padding: const EdgeInsets.all(18),
                child: TextField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    labelText: 'Procurar por...',
                    border: OutlineInputBorder(),
                  ),
                  onSubmitted: (final String value) {
                    setState(() {
                      _search = value;
                    });
                  },
                ),
              ),

              /// List
              GridView.builder(
                padding: const EdgeInsets.all(18),
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (final BuildContext context, final int index) {
                  final PaperModel paper = snapshot.data![index];
                  return PaperCardWidget(paper);
                },
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 400,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1.5,
                ),
              ),

              /// Pagination
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: _page > 0
                        ? () {
                            setState(() {
                              _page--;
                            });
                          }
                        : null,
                  ),
                  const SizedBox(width: 18),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward),
                    onPressed: snapshot.data!.length == _pageSize
                        ? () {
                            setState(() {
                              _page++;
                            });
                          }
                        : null,
                  ),
                ],
              ),
            ],
          );
        }

        /// On No Data
        return const Center(
          child: Text('No data'),
        );
      },
    );
  }
}
