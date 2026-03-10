// import 'package:flutter/material.dart';

// class KamlaScreen extends StatefulWidget {
//   const KamlaScreen({super.key});

//   @override
//   State<KamlaScreen> createState() => _KamlaScreenState();
// }

// class _KamlaScreenState extends State<KamlaScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular((10)),
//             child: Image.network(
//               '',
//               fit: BoxFit.fitWidth,
//               loadingBuilder: (context, child, loadingProgress) {
//                 if (loadingProgress == null) return child;
//                 return const Center(child: CircularProgressIndicator());
//               },
//               errorBuilder: (context, error, stackTrace) {
//                 return const Icon(Icons.broken_image);
//               },
//             ),
//           ),
//           SizedBox(height: 10),
//           Text(
//             'Hello',
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontFamily: 'Times',
//               fontWeight: FontWeight.w600,
//               color: Colors.black,
//               fontSize: 18,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_apis_of_imagify_app/view/kalmaScreen/kalma_screen_view_model.dart';

class KamlaScreen extends StatefulWidget {
  const KamlaScreen({super.key});

  @override
  State<KamlaScreen> createState() => _KamlaScreenState();
}

class _KamlaScreenState extends State<KamlaScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch data after first frame renders
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<KalmaScreenViewModel>(
        context,
        listen: false,
      ).getKalmaData(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kalma')),
      body: Consumer<KalmaScreenViewModel>(
        builder: (context, viewModel, child) {
          // Show loader while fetching
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          // Show message if list is empty
          if (viewModel.kalmaList.isEmpty) {
            return const Center(child: Text('No data found'));
          }

          // Display list of kalma items
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: viewModel.kalmaList.length,
            itemBuilder: (context, index) {
              final kalma = viewModel.kalmaList[index];

              return Card(
                margin: const EdgeInsets.only(bottom: 16),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Thumbnail image
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                      child: Image.network(
                        kalma.thumbnailUrl ?? '',
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const SizedBox(
                            height: 180,
                            child: Center(child: CircularProgressIndicator()),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return const SizedBox(
                            height: 180,
                            child: Center(
                              child: Icon(Icons.broken_image, size: 48),
                            ),
                          );
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          // English name
                          Text(
                            kalma.name ?? '',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: 'Times',
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),

                          const SizedBox(height: 6),

                          // Urdu name
                          Text(
                            kalma.urduName ?? '',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
