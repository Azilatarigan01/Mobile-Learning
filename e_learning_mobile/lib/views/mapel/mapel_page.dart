import 'package:e_learning_sma_tuna_bangsa/utils/app_constants.dart';
import 'package:e_learning_sma_tuna_bangsa/viewmodels/guru_view_model.dart';
import 'package:e_learning_sma_tuna_bangsa/viewmodels/mapel_view_model.dart';
import 'package:e_learning_sma_tuna_bangsa/views/mapel/mapel_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MapelPage extends StatefulWidget {
  const MapelPage({super.key});

  @override
  State<MapelPage> createState() => _MapelPageState();
}

class _MapelPageState extends State<MapelPage> {
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
    final status = context.watch<MapelViewModel>().status;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppConstants.background,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "My Subject",
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
              padding: const EdgeInsets.all(20),
              itemCount: listMapel.length,
              itemBuilder: (context, index) {
                final mapel = listMapel[index];
                return MapelItem(
                  mapel: mapel,
                  listGuru: listGuru,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String statusMessage(MapelStatus status) {
    if (status == MapelStatus.error) return "Gagal mengambil data mapel";
    if (status == MapelStatus.loading) return "Mengambil data mapel...";
    return "";
  }
}
