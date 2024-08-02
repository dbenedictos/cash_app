import 'package:cash_app/features/balance_page/balance_page.dart';
import 'package:cash_app/features/send_money_page/send_money_page.dart';
import 'package:cash_app/features/transactions_page/transactions_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'router_builder.g.dart';

@TypedGoRoute<BalancePageRoute>(
  path: '/balance-page',
  routes: [
    TypedGoRoute<SendMoneyPageRoute>(path: ':userId/send-money-page'),
    TypedGoRoute<TransactionsPageRoute>(path: ':userId/transactions-page')
  ],
)
@immutable
class BalancePageRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => const NoTransitionPage(child: BalancePage());
}

@immutable
class SendMoneyPageRoute extends GoRouteData {
  const SendMoneyPageRoute({required this.userId});

  final int userId;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => const NoTransitionPage(child: SendMoneyPage());
}

@immutable
class TransactionsPageRoute extends GoRouteData {
  const TransactionsPageRoute({required this.userId});

  final int userId;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      NoTransitionPage(child: TransactionsPage(userId: userId));
}
