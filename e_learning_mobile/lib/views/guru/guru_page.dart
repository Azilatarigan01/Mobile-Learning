import 'package:e_learning_sma_tuna_bangsa/utils/app_constants.dart';
import 'package:e_learning_sma_tuna_bangsa/viewmodels/guru_view_model.dart';
import 'package:e_learning_sma_tuna_bangsa/viewmodels/mapel_view_model.dart';
import 'package:e_learning_sma_tuna_bangsa/views/guru/guru_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GuruPage extends StatefulWidget {
  const GuruPage({super.key});

  @override
  State<GuruPage> createState() => _GuruPageState();
}

class _GuruPageState extends State<GuruPage> {
  void getData(timestamp) {
    context.read<GuruViewModel>().getGuru();
    context.read<MapelViewModel>().getMapel();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(getData);
  }

  @override
  Widget build(BuildContext context) {
    final listGuru = context.watch<GuruViewModel>().listGuru;
    final listMapel = context.watch<MapelViewModel>().listMapel;
    final status = context.watch<GuruViewModel>().status;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppConstants.background,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "My Teacher",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          Text(
            statusMessage(status),
            style: const TextStyle(color: Colors.grey),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              itemCount: listGuru.length,
              itemBuilder: (context, index) {
                final guru = listGuru[index];
                return GuruItem(
                  guru: guru,
                  listMapel: listMapel,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String statusMessage(GuruStatus status) {
    if (status == GuruStatus.error) return "Gagal mengambil data guru";
    if (status == GuruStatus.loading) return "Mengambil data guru...";
    return "";
  }
}
