import 'dart:convert';
import 'dart:io';
import 'package:testing_apis_of_imagify_app/Data/app_excaption.dart';
import 'package:testing_apis_of_imagify_app/Network/base_api_service.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NetworkApiService extends BaseApiService {
  @override
  Future getApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http
          .get(Uri.parse(url))
          .timeout(Duration(seconds: 10));
      responseJson = returnRespose(response);
    } on SocketException {
      throw FeatchDataException('No internet Found ');
    }
    return responseJson;
  }

  @override
  Future<dynamic> postApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      final response = await post(
        Uri.parse(url),
        body: data,
      ).timeout(Duration(seconds: 10));
      responseJson = returnRespose(response);
    } on SocketException {
      throw FeatchDataException('No Internet found');
    }

    return responseJson;
  }

  dynamic returnRespose(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic resposneJson = jsonDecode(response.body);
        return resposneJson;
      case 404:
        throw BadRequestException('Bad network Exceptin : ${response.body}');
    }
  }
}
