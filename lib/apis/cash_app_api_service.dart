import 'package:cash_app/apis/api_client.dart';
import 'package:cash_app/apis/api_service.dart';
import 'package:cash_app/apis/handlers/transaction_handler.dart';
import 'package:cash_app/apis/handlers/user_handler.dart';
import 'package:cash_app/apis/handlers/wallet_handler.dart';

class CashAppApiService extends ApiService {
  CashAppApiService();

  ApiClient _createApiClient() =>
      createApiClient(baseUrl: 'https://my-json-server.typicode.com/dbenedictos/cash_app_database');

  UserApi? _userApi;
  WalletApi? _walletApi;
  TransactionApi? _transactionApi;

  UserApi userApi() => _userApi ??= UserApi(_createApiClient());
  WalletApi walletApi() => _walletApi ??= WalletApi(_createApiClient());
  TransactionApi transactionApi() => _transactionApi ??= TransactionApi(_createApiClient());
}
