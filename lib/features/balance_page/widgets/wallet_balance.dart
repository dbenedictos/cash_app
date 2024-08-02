import 'package:cash_app/apis/models/wallet.dart';
import 'package:cash_app/cubit/async_state.dart';
import 'package:cash_app/cubit/wallet_cubit/wallet_cubit.dart';
import 'package:cash_app/features/widgets/elevated_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WalletBalance extends StatefulWidget {
  const WalletBalance({
    required this.userId,
    super.key,
  });

  final int userId;

  @override
  State<WalletBalance> createState() => _WalletBalanceState();
}

class _WalletBalanceState extends State<WalletBalance> {
  bool isBalanceVisible = false;

  late WalletCubit walletCubit;

  @override
  void initState() {
    super.initState();

    walletCubit = BlocProvider.of<WalletCubit>(context)..getWalletByUser(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedContainer(
      padding: const EdgeInsets.only(
        top: 32,
        left: 32,
        bottom: 32,
        right: 8,
      ),
      child: BlocBuilder<WalletCubit, AsyncState<Wallet>>(
        bloc: walletCubit,
        builder: (context, state) => state.when(
          (wallet) {
            final amountTruncated = wallet.balance.truncate();
            final decimal = (wallet.balance - amountTruncated) * 100;

            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isBalanceVisible)
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '₱ $amountTruncated',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 35,
                            letterSpacing: -3,
                          ),
                        ),
                        TextSpan(
                          text: ' .${decimal.toStringAsFixed(0)}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            letterSpacing: -1,
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  const Text(
                    '₱ *******',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                      letterSpacing: -3,
                    ),
                  ),
                const SizedBox(width: 24),
                IconButton(
                    onPressed: () {
                      setState(() {
                        isBalanceVisible = !isBalanceVisible;
                      });
                    },
                    icon: Icon(isBalanceVisible ? Icons.visibility : Icons.visibility_off)),
              ],
            );
          },
          loading: () => const Padding(
            padding: EdgeInsets.only(right: 24),
            child: CircularProgressIndicator(),
          ),
          error: (message) => Text(message ?? ''),
        ),
      ),
    );
  }
}
