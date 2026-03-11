import 'package:testing_apis_of_imagify_app/Network/base_api_service.dart';
import 'package:testing_apis_of_imagify_app/Network/network_api_service.dart';
import 'package:testing_apis_of_imagify_app/res/app_url.dart';

class QuranRepository {
  final BaseApiService _myApiServices = NetworkApiService();

  Future<dynamic> quranApiData() async {
    try {
      dynamic response = await _myApiServices.getApiResponse(
        AppUrl.quranEndPoint,
      );

      print("API Response : $response");

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
