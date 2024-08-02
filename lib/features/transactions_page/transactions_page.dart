import 'package:cash_app/cubit/transactions_cubit/transactions_cubit.dart';
import 'package:cash_app/features/transactions_page/widgets/transactions_list.dart';
import 'package:cash_app/repositories/cash_app_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({
    required this.userId,
    super.key,
  });

  final int userId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TransactionsCubit(CashAppRepository())..getByUser(userId),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Transactions'),
        ),
        body: const TransactionsList(),
      ),
    );
  }
}
