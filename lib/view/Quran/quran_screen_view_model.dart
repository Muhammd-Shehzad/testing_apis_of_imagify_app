import 'package:flutter/material.dart';
import 'package:testing_apis_of_imagify_app/Data/Model/quran_model.dart';
import 'package:testing_apis_of_imagify_app/Repository/quran_repository.dart';

class QuranScreenViewModel extends ChangeNotifier {
  final _myRepo = QuranRepository();

  bool _loading = false;
  bool get loading => _loading;

  QuranModel? _quranData;
  QuranModel? get quranModel => _quranData;

  List<Surahs> get surahList => _quranData?.data?.surahs ?? [];

  Future<void> getQuranData() async {
    _loading = true;
    notifyListeners();

    try {
      final response = await _myRepo.quranApiData();

      _quranData = QuranModel.fromJson(response);
    } catch (e) {
      print(e);
    }

    _loading = false;
    notifyListeners();
  }
}
