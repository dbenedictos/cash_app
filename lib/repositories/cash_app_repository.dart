import 'package:cash_app/apis/cash_app_api_service.dart';
import 'package:cash_app/apis/models/transaction.dart';
import 'package:cash_app/apis/models/user.dart';
import 'package:cash_app/apis/models/wallet.dart';
import 'package:cash_app/main.dart';

class CashAppRepository {
  CashAppApiService get _api => getIt<CashAppApiService>();

  Future<User> getUserById(int id) async {
    final user = await _api.userApi().getById(id);
    return user;
  }

  Future<Wallet> getWalletByUser(int userId) async {
    final wallet = await _api.walletApi().getByUser(userId);
    return wallet;
  }

  Future<Wallet> updateWallet(Wallet body) async {
    final wallet = await _api.walletApi().update(body);

    return wallet;
  }

  Future<List<Transaction>> getTransactionsByUser(int userId) async {
    final transactions = await _api.transactionApi().getByUser(userId);
    return transactions;
  }
}
