import 'package:cash_app/apis/api_client.dart';
import 'package:cash_app/apis/models/wallet.dart';

class WalletApi {
  WalletApi(this.apiClient);

  final ApiClient apiClient;

  Future<Wallet> getByUser(int userId) async {
    final queryParams = <String, dynamic>{};

    queryParams['user'] = userId.toString();

    final baseUri = Uri.parse(apiClient.baseUrl);
    final uri = baseUri.replace(
      queryParameters: queryParams,
      path: '${baseUri.path}/wallets',
    );

    return await apiClient.dio.getUri(uri).then((response) {
      final wallets = response.data as List;
      return Wallet.fromJson(wallets.first as Map<String, dynamic>);
    });
  }

  Future<Wallet> update(Wallet body) async {
    final baseUri = Uri.parse(apiClient.baseUrl);

    final uri = baseUri.replace(
      path: '${baseUri.path}/wallets/${body.id}',
    );

    return await apiClient.dio.putUri<Map<String, dynamic>>(uri, data: body.toJson()).then((response) {
      return Wallet.fromJson(response.data!);
    });
  }
}
