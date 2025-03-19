import 'package:cfp_front/views/widgets/paper_list.dart';
import 'package:flutter/material.dart';

///
///
///
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

///
///
///
class _HomeViewState extends State<HomeView> {
  ///
  ///
  ///
  @override
  Widget build(final BuildContext context) {
    return const SingleChildScrollView(
      child: PaperList(),
    );
  }
}
