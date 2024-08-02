import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:cash_app/apis/models/wallet.dart';
import 'package:cash_app/cubit/async_state.dart';
import 'package:cash_app/cubit/wallet_cubit/wallet_cubit.dart';
import 'package:cash_app/features/send_money_page/widgets/alert_modal.dart';
import 'package:cash_app/features/widgets/elevated_container.dart';
import 'package:cash_app/utilities/router_builder.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SendMoneyPage extends StatefulWidget {
  const SendMoneyPage({super.key});

  @override
  State<SendMoneyPage> createState() => _SendMoneyPageState();
}

class _SendMoneyPageState extends State<SendMoneyPage> {
  late final TextEditingController textController;

  late WalletCubit walletCubit;

  @override
  void initState() {
    textController = TextEditingController(text: '')..addListener(() => setState(() {}));

    super.initState();

    walletCubit = BlocProvider.of<WalletCubit>(context);
  }

  AsyncState<Wallet> get walletState => walletCubit.state;

  void _unFocus() => FocusManager.instance.primaryFocus?.unfocus();

  Future<void> _onPressSend() async {
    _unFocus();
    final wallet = walletState.whenOrNull((wallet) => wallet);

    if (wallet == null) return;

    final transferAmount = double.tryParse(textController.text);
    if (transferAmount == null) return;

    final remainingBalance = wallet.balance - transferAmount;
    if (remainingBalance < 0) {
      return _showFailModal();
    }

    final updatedWallet = wallet.copyWith(balance: wallet.balance - transferAmount);

    walletCubit.updateWallet(updatedWallet);
  }

  Future<void> _showFailModal() async => showModalBottomSheet<void>(
        isDismissible: false,
        context: context,
        builder: (context) => AlertModal.fail(onTapDismiss: () {
          context.go(BalancePageRoute().location);
        }),
      );

  @override
  Widget build(BuildContext context) {
    return BlocListener<WalletCubit, AsyncState<Wallet>>(
      listener: (context, state) {
        state.whenOrNull(
          (wallet) => showModalBottomSheet<void>(
            isDismissible: false,
            context: context,
            builder: (context) => AlertModal.success(onTapDismiss: () {
              context.go(BalancePageRoute().location);
            }),
          ),
          error: (_) => _showFailModal(),
        );
      },
      bloc: context.read<WalletCubit>(),
      child: GestureDetector(
        onTap: _unFocus,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text('Send money'),
          ),
          body: Column(
            children: [
              ElevatedContainer(
                margin: const EdgeInsets.all(16),
                child: AutoSizeTextField(
                  controller: textController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 50,
                    letterSpacing: -3,
                    fontWeight: FontWeight.w300,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    prefixText: '₱',
                    prefixStyle: TextStyle(
                      fontSize: 50,
                      letterSpacing: -3,
                      fontWeight: FontWeight.w300,
                    ),
                    hintText: 'Enter amount',
                    hintMaxLines: 2,
                    hintStyle: TextStyle(
                      fontSize: 25,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              if (textController.text.isNotBlank)
                ElevatedButton(
                  onPressed: _onPressSend,
                  child: BlocBuilder<WalletCubit, AsyncState<Wallet>>(
                      bloc: walletCubit,
                      builder: (context, state) {
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('Send'),
                            ...?state.whenOrNull(
                              (_) => null,
                              loading: () => [
                                const SizedBox(width: 15),
                                const SizedBox.square(
                                  dimension: 20,
                                  child: CircularProgressIndicator(),
                                ),
                              ],
                            ),
                          ],
                        );
                      }),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
