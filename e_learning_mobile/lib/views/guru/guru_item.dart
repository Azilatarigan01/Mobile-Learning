import 'dart:developer';

import 'package:e_learning_sma_tuna_bangsa/models/guru_model.dart';
import 'package:e_learning_sma_tuna_bangsa/models/mapel_model.dart';
import 'package:flutter/material.dart';

class GuruItem extends StatelessWidget {
  final GuruModel guru;
  final List<MapelModel> listMapel;
  const GuruItem({
    super.key,
    required this.guru,
    required this.listMapel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.black12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(
              guru.gambar,
              fit: BoxFit.cover,
              height: 90,
              width: 90,
              errorBuilder: (context, error, stackTrace) {
                log(error.toString());
                return const SizedBox(
                  height: 90,
                  width: 90,
                  child: Icon(
                    Icons.person_rounded,
                    size: 50,
                  ),
                );
              },
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                guru.nama,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                guru.getMapel(listMapel),
                style: const TextStyle(
                  color: Colors.black38,
                  fontSize: 14,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
