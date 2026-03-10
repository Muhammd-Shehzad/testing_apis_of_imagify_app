// import 'package:flutter/material.dart';
// import 'package:testing_apis_of_imagify_app/Core/Utils/utils.dart';
// import 'package:testing_apis_of_imagify_app/Repository/kalma_repository.dart';

// class KalmaScreenViewModel extends ChangeNotifier {
//   final _myRepo = KalmaRepository();

//   Future<void> getKalmaData(BuildContext context) async {
//     _myRepo
//         .kalmaApi()
//         .then((v) {
//           Utils.flashBarErrorMesage('Data Featch Sucessfly', context);
//         })
//         .onError((error, StackTrace) {
//           Utils.flashBarErrorMesage('Error fetching data', context);
//         });
//   }
// }
import 'package:flutter/material.dart';
import 'package:testing_apis_of_imagify_app/Core/Utils/utils.dart';
import 'package:testing_apis_of_imagify_app/Data/Model/kalma_model.dart';
import 'package:testing_apis_of_imagify_app/Repository/kalma_repository.dart';

class KalmaScreenViewModel extends ChangeNotifier {
  final _myRepo = KalmaRepository();

  List<KalmaModel> _kalmaList = [];
  List<KalmaModel> get kalmaList => _kalmaList;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getKalmaData(BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    _myRepo
        .kalmaApi()
        .then((response) {
          // API returns a list directly
          _kalmaList = (response as List)
              .map((item) => KalmaModel.fromJson(item))
              .toList();
          _isLoading = false;
          notifyListeners();
          Utils.flashBarErrorMesage('Data Fetched Successfully', context);
        })
        .onError((error, stackTrace) {
          _isLoading = false;
          notifyListeners();
          Utils.flashBarErrorMesage('Error fetching data', context);
        });
  }
}
