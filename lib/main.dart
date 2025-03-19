import 'package:cfp_front/routes/base_route.dart';
import 'package:cfp_front/utils/config.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

///
///
///
class MyApp extends StatelessWidget {
  ///
  ///
  ///
  const MyApp({super.key});

  ///
  ///
  ///
  @override
  Widget build(final BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: Config().appName,
      theme: Config().theme,
      routerConfig: BaseRoute().routes,

    );
  }
}
