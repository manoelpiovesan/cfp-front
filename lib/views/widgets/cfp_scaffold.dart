import 'package:cfp_front/views/widgets/cfp_drawer.dart';
import 'package:flutter/material.dart';

class CfpScaffold extends StatefulWidget {
  final Widget body;

  const CfpScaffold({required this.body, super.key});

  @override
  State<CfpScaffold> createState() => _CfpScaffoldState();
}

///
///
///
class _CfpScaffoldState extends State<CfpScaffold> {
  ///
  ///
  ///
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Call for Papers'),
      ),
      body: widget.body,
      drawer: const CfpDrawer(),
    );
  }
}
