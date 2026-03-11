import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_apis_of_imagify_app/view/Quran/quran_screen_view_model.dart';
import 'package:testing_apis_of_imagify_app/view/kalmaScreen/kamla_screen.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  @override
  void initState() {
    super.initState();

    // ✅ API CALL (THIS WAS MISSING)
    Future.microtask(() {
      Provider.of<QuranScreenViewModel>(context, listen: false).getQuranData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('القرآن الكريم'), centerTitle: true),

      body: Consumer<QuranScreenViewModel>(
        builder: (context, viewModel, child) {
          /// Loader
          if (viewModel.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          /// No Data
          if (viewModel.surahList.isEmpty) {
            return const Center(child: Text("No data found"));
          }

          /// Surah List
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: viewModel.surahList.length,
            itemBuilder: (context, index) {
              final surah = viewModel.surahList[index];

              return Card(
                margin: const EdgeInsets.only(bottom: 10),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),

                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.teal,
                    child: Text(
                      '${surah.number}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),

                  title: Text(
                    surah.englishName ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

                  subtitle: Text(surah.englishNameTranslation ?? ''),

                  trailing: Text(
                    surah.name ?? '',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),

                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const KamlaScreen()),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
