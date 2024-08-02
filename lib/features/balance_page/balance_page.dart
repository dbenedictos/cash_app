import 'package:cash_app/apis/models/user.dart';
import 'package:cash_app/cubit/async_state.dart';
import 'package:cash_app/cubit/user_cubit/user_cubit.dart';
import 'package:cash_app/features/balance_page/widgets/wallet_balance.dart';
import 'package:cash_app/utilities/router_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BalancePage extends StatelessWidget {
  const BalancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Balance'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocBuilder<UserCubit, AsyncState<User>>(
            bloc: BlocProvider.of<UserCubit>(context),
            builder: (context, state) => state.when(
                  (user) => Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 15),
                      Text(
                        'Welcome ${user.firstName}',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      const SizedBox(height: 20),
                      Center(child: WalletBalance(userId: user.id)),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () => context.go(SendMoneyPageRoute(userId: user.id).location),
                            child: const Text('Send Money'),
                          ),
                          const SizedBox(width: 15),
                          ElevatedButton(
                            onPressed: () => context.go(TransactionsPageRoute(userId: user.id).location),
                            child: const Text('Transactions'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (message) => Text(message ?? ''),
                )),
      ),
    );
  }
}
