import 'package:cash_app/apis/api_client.dart';
import 'package:cash_app/apis/models/user.dart';

class UserApi {
  UserApi(this.apiClient);

  final ApiClient apiClient;

  Future<User> getById(int id) async {
    final baseUri = Uri.parse(apiClient.baseUrl);
    final uri = baseUri.replace(path: '${baseUri.path}/users/$id/');

    return await apiClient.dio.getUri(uri).then((response) {
      return User.fromJson(response.data! as Map<String, dynamic>);
    });
  }
}
