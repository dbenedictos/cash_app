import 'package:cash_app/apis/api_client.dart';

abstract class ApiService {
  ApiClient createApiClient({required String baseUrl}) => ApiClient(baseUrl: baseUrl);
}
