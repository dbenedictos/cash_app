import 'package:cash_app/apis/api_client.dart';
import 'package:cash_app/apis/models/transaction.dart';
import 'package:dartx/dartx.dart';

class TransactionApi {
  TransactionApi(this.apiClient);

  final ApiClient apiClient;

  Future<List<Transaction>> getByUser(int userId) async {
    final queryParams = <String, dynamic>{};

    queryParams['user'] = userId.toString();

    final baseUri = Uri.parse(apiClient.baseUrl);
    final uri = baseUri.replace(
      queryParameters: queryParams,
      path: '${baseUri.path}/transactions',
    );

    return await apiClient.dio.getUri(uri).then((response) {
      final transactionsRaw =
          (response.data as List).map((e) => Transaction.fromJson(e as Map<String, dynamic>)).toList();

      return List<Transaction>.from(transactionsRaw).sortedBy((e) => e.postedDate).reversed.toList();
    });
  }
}
