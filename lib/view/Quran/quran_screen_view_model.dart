import 'package:flutter/material.dart';
import 'package:testing_apis_of_imagify_app/Core/Utils/utils.dart';
import 'package:testing_apis_of_imagify_app/Data/Model/quran_model.dart';
import 'package:testing_apis_of_imagify_app/Repository/quran_repository.dart';

class QuranScreenViewModel {
  final _myRepo = QuranRepository();
  bool _loading = false;
  bool get loading => _loading;

  QuranModel? _quranModel;
  QuranModel? get quranModel => _quranModel;

  // List<Surahs>

  Future<dynamic> getQuranData(BuildContext context) async {
    _myRepo
        .quranApiData()
        .then((response) {
          // API returns a list directly

          Utils.flashBarErrorMesage('Data Fetched Successfully', context);
        })
        .onError((error, stackTrace) {
          _loading = false;

          Utils.flashBarErrorMesage('Error fetching data', context);
        });
  }
}
