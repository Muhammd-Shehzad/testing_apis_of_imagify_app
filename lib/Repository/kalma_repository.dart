import 'package:testing_apis_of_imagify_app/Network/base_api_service.dart';
import 'package:testing_apis_of_imagify_app/Network/network_api_service.dart';
import 'package:testing_apis_of_imagify_app/res/app_url.dart';

class KalmaRepository {
  final BaseApiService _apiService = NetworkApiService();

  Future<dynamic> kalmaApi() async {
    try {
      dynamic response = await _apiService.getApiResponse(
        AppUrl.kamlaApiEndPoint,
      );
      print(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
