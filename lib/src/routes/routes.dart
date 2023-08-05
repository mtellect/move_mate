import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:move_mate/src/index_page.dart';
import 'package:move_mate/src/views/shipment/ship_calculate.dart';
import 'package:move_mate/src/views/shipment/ship_calculated.dart';
import 'package:move_mate/src/views/shipment/ship_home.dart';
import 'package:move_mate/src/views/shipment/ship_shipment.dart';
import 'package:move_mate/src/views/splash.dart';
import 'app_routes.dart';

class GetContext {
  static BuildContext? get rootContext => RouteHelper.rootNavigatorKey.currentContext;
  static NavigatorState? get rootState => RouteHelper.rootNavigatorKey.currentState;

  static BuildContext? get goContext => RouteHelper.rootNavigatorKey.currentContext;
  static NavigatorState? get goNavigator => RouteHelper.rootNavigatorKey.currentState;
}

class RouteHelper {
  static final routeObserver = RouteObserver<ModalRoute>();
  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static final goNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter goRouter = GoRouter(
      navigatorKey: goNavigatorKey,
      debugLogDiagnostics: true,
      initialLocation: AppRoutes.splash.path,
      routes: <RouteBase>[
        // shipment index
        StatefulShellRoute.indexedStack(
            pageBuilder: (context, state, navShell) =>
                FadeTransitionPage(key: state.pageKey, child: IndexPage(navShell: navShell)),
            branches: [
              AppRoutes.shipHome,
              AppRoutes.shipCalculate,
              AppRoutes.shipShipment,
              AppRoutes.shipProfile,
            ].map((e) {
              return StatefulShellBranch(
                navigatorKey: e.navKey,
                routes: <RouteBase>[
                  GoRoute(
                    path: e.path,
                    name: e.name,
                    pageBuilder: (BuildContext context, GoRouterState state) => FadeTransitionPage(
                      key: state.pageKey,
                      child: switch (e) {
                        AppRoutes.shipHome => ShipHome(),
                        AppRoutes.shipCalculate => ShipCalculate(),
                        AppRoutes.shipShipment => ShipShipment(),
                        _ => Container()
                      },
                    ),
                  ),
                ],
              );
            }).toList()),

        GoRoute(
          path: AppRoutes.shipCalculated.path,
          name: AppRoutes.shipCalculated.name,
          pageBuilder: (c, state) =>
              FadeTransitionPage(key: state.pageKey, child: ShipCalculated()),
        ),

        GoRoute(
          path: AppRoutes.splash.path,
          name: AppRoutes.splash.name,
          pageBuilder: (c, state) => FadeTransitionPage(key: state.pageKey, child: SplashPage()),
        ),
      ],
      redirect: _handleOnRedirects);

  static FutureOr<String?> _handleOnRedirects(BuildContext context, GoRouterState state) async {
    // if the user is not logged in, they need to login
    final location = state.uri.toString();
    final path = state.path;
    final matchedLocation = state.matchedLocation;
    final bool loggingIn = matchedLocation == '/login';

    if (loggingIn) {
      return '/';
    }
    return null; // no need to redirect at all
  }

  static String getRouteAsEncodedUrl(
      {required String path, Map<String, dynamic>? queryParameters}) {
    final uri = Uri.parse(path).replace(queryParameters: queryParameters);
    return uri.toString();
  }
}

/// A page that fades in an out.
class FadeTransitionPage extends CustomTransitionPage<void> {
  /// Creates a [FadeTransitionPage].
  FadeTransitionPage({
    required LocalKey super.key,
    required super.child,
  }) : super(
            transitionsBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation, Widget child) =>
                FadeTransition(
                  opacity: animation.drive(_curveTween),
                  child: child,
                ));

  static final CurveTween _curveTween = CurveTween(curve: Curves.ease);
}
