import 'package:cash_app/features/balance_page/balance_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'router_builder.g.dart';

@TypedGoRoute<BalancePageRoute>(
  path: '/balance-page',
)
@immutable
class BalancePageRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => const NoTransitionPage(child: BalancePage());
}
