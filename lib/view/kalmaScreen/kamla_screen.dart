import 'package:flutter/material.dart';

class KamlaScreen extends StatefulWidget {
  const KamlaScreen({super.key});

  @override
  State<KamlaScreen> createState() => _KamlaScreenState();
}

class _KamlaScreenState extends State<KamlaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular((10)),
            child: Image.network(
              '',
              fit: BoxFit.fitWidth,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(child: CircularProgressIndicator());
              },
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.broken_image);
              },
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Hello',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Times',
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
