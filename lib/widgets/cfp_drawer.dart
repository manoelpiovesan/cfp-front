import 'package:cfp_front/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

///
///
///
class CfpDrawer extends StatelessWidget {
  const CfpDrawer({super.key});

  ///
  ///
  ///
  @override
  Widget build(final BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blueGrey,
            ),
            child: Center(
              child: Text(
                Config().appName,
                style: const TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),

          /// Papers
          ListTile(
            leading: const Icon(Icons.article),
            title: const Text('Papers'),
            subtitle: const Text('Lista de artigos submetidos'),
            onTap: () => GoRouter.of(context).goNamed('home'),
          ),

          /// Submit
          ListTile(
            title: const Text('Submeter'),
            subtitle: const Text('Submeta seu artigo'),
            leading: const Icon(Icons.upload_file),
            onTap: () => GoRouter.of(context).goNamed('submit'),
          ),
        ],
      ),
    );
  }
}
