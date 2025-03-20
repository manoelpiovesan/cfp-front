import 'package:cfp_front/widgets/login_widget.dart';
import 'package:cfp_front/widgets/submit_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

///
///
///
class SubmitPaperView extends StatefulWidget {
  const SubmitPaperView({super.key});

  @override
  State<SubmitPaperView> createState() => _SubmitPaperViewState();
}

///
///
///
class _SubmitPaperViewState extends State<SubmitPaperView> {
  ///
  ///
  ///
  @override
  Widget build(final BuildContext context) {
    return Center(
      child: FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder: (
          final BuildContext context,
          final AsyncSnapshot<SharedPreferences> snapshot,
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
            return snapshot.data!.getString('token') == null
                ? const LoginWidget()
                : const SubmitFormWidget();
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
