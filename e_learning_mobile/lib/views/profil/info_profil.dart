import 'package:flutter/material.dart';

class InfoProfil extends StatelessWidget {
  final String judul;
  final String body;

  const InfoProfil({
    super.key,
    required this.judul,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            judul,
            style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF091F44),
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 15),
          Text(
            body,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF091F44),
            ),
          ),
        ],
      ),
    );
  }
}
