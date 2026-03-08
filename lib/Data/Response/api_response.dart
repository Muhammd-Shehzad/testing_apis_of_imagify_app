import 'package:testing_apis_of_imagify_app/Data/Response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse({this.status, this.data, this.message});

  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.complated() : status = Status.COMPLETED;
  ApiResponse.error() : status = Status.ERROR;
}
