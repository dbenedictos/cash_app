import 'package:cash_app/apis/models/transaction.dart';
import 'package:cash_app/cubit/async_state.dart';
import 'package:cash_app/cubit/transactions_cubit/transactions_cubit.dart';
import 'package:cash_app/features/transactions_page/widgets/transaction_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionsList extends StatelessWidget {
  const TransactionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionsCubit, AsyncState<List<Transaction>>>(
      bloc: BlocProvider.of<TransactionsCubit>(context),
      builder: (context, state) => state.when(
        (transactions) => ListView.separated(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 50,
            left: 16,
            right: 16,
          ),
          itemCount: transactions.length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) => TransactionTile(transactions.elementAt(index)),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (message) => Text(message ?? ''),
      ),
    );
  }
}
