import 'package:cfp_front/views/home_view.dart';
import 'package:cfp_front/views/register_view.dart';
import 'package:cfp_front/views/submit_paper_view.dart';
import 'package:cfp_front/widgets/cfp_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

///
///
///
class BaseRoute {
  final GlobalKey<NavigatorState> _shellNavigatorKey =
      GlobalKey<NavigatorState>();

  final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();

  ///
  ///
  ///
  GoRouter get routes => GoRouter(
        navigatorKey: _rootNavigatorKey,
        initialLocation: '/',
        routes: <RouteBase>[
          /// Shell
          ShellRoute(
            navigatorKey: _shellNavigatorKey,
            builder: (
              final BuildContext context,
              final GoRouterState state,
              final Widget child,
            ) {
              return CfpScaffold(
                body: child,
                key: state.pageKey,
              );
            },
            routes: <RouteBase>[
              /// Home
              GoRoute(
                name: 'home',
                path: '/',
                pageBuilder:
                    (final BuildContext context, final GoRouterState state) {
                  return NoTransitionPage<HomeView>(
                    child: HomeView(
                      key: state.pageKey,
                    ),
                  );
                },
              ),

              /// Submit
              GoRoute(
                name: 'submit',
                path: '/submit',
                pageBuilder:
                    (final BuildContext context, final GoRouterState state) {
                  return NoTransitionPage<SubmitPaperView>(
                    child: SubmitPaperView(
                      key: state.pageKey,
                    ),
                  );
                },
              ),


              /// Register
              GoRoute(
                name: 'register',
                path: '/register',
                pageBuilder:
                    (final BuildContext context, final GoRouterState state) {
                  return NoTransitionPage<RegisterView>(
                    child: RegisterView(
                      key: state.pageKey,
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      );
}
