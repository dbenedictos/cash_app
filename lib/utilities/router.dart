import 'package:cash_app/main.dart';
import 'package:cash_app/utilities/router_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  navigatorKey: navigatorKey,
  errorBuilder: (context, state) => const SizedBox(),
  initialLocation: '/',
  debugLogDiagnostics: kDebugMode,
  redirect: (context, state) {
    if (state.matchedLocation == '/') {
      return BalancePageRoute().location;
    }

    return null;
  },
  routes: $appRoutes,
);
