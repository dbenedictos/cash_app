import 'package:cash_app/apis/cash_app_api_service.dart';
import 'package:cash_app/apis/models/transaction.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter_test/flutter_test.dart';

import 'utilities/test_helper.dart';

void main() {
  const testUserId = 1;

  final cashAppApi = CashAppApiService();

  group('User Api', () {
    final userApi = cashAppApi.userApi();

    test('test get user by ID', () async {
      final user = await userApi.getById(testUserId);

      // test if all user parameters is non blank and non zero
      expectTrue(user.id > 0);
      expectTrue(user.firstName.isNotBlank);
      expectTrue(user.lastName.isNotBlank);
    });
  });

  group('Wallet Api', () {
    final walletApi = cashAppApi.walletApi();

    test('test get wallet by user ID', () async {
      final wallet = await walletApi.getByUser(testUserId);

      // test if id and wallet user are non zero
      expectTrue(wallet.id > 0);
      expectTrue(wallet.user > 0);

      // test if wallet is owned by the user
      expect(wallet.user, testUserId);

      // test if wallet balance is non negative
      // forced unwrapped balance since in the test above nullability has already been checked
      expectTrue(wallet.balance >= 0.0);
    });

    test('test updating of wallet', () async {
      const transactionAmount = 5000;

      // get current wallet
      final wallet = await walletApi.getByUser(testUserId);

      // update wallet balance
      final updatedBalance = wallet.balance - transactionAmount;
      final updatedWallet = wallet.copyWith(balance: updatedBalance);

      final responseWallet = await walletApi.update(updatedWallet);

      // test if wallet is owned by the user
      expect(responseWallet.user, testUserId);

      // test if wallet is the same wallet
      expect(responseWallet.id, wallet.id);

      // test if wallet balance is the same as the computed updatedBalance
      expect(responseWallet.balance, updatedBalance);
    });
  });

  group('Transaction Api', () {
    final transactionApi = cashAppApi.transactionApi();

    test('test fetching of transactions by user ID', () async {
      final transactions = await transactionApi.getByUser(testUserId);

      // test if all transactions has valid ids
      expectTrue(transactions.all((transaction) => transaction.id > 0));

      // test if all transactions have valid amounts
      expectTrue(transactions.all((transaction) => transaction.amount > 0));

      // test if all transactions have a valid type
      expectTrue(transactions.all((transaction) => transaction.type == Type.DEBIT || transaction.type == Type.CREDIT));

      // test if the transactions belongs to the user
      expectTrue(transactions.all((transaction) => transaction.user == testUserId));
    });
  });
}
