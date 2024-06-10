import 'package:flutter/material.dart';
import 'package:e_learning_sma_tuna_bangsa/views/lokasi/lokasi_maps.dart';

class LokasiPage extends StatefulWidget {
  const LokasiPage({Key? key}) : super(key: key);

  @override
  State<LokasiPage> createState() => _LokasiPageState();
}

class _LokasiPageState extends State<LokasiPage> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const LokasiMaps(),
        // Isi dengan apa pun yang diperlukan di sini
      ],
    );
  }
}
