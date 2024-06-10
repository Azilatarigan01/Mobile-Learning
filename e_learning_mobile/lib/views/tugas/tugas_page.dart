import 'package:e_learning_sma_tuna_bangsa/viewmodels/mapel_view_model.dart';
import 'package:e_learning_sma_tuna_bangsa/viewmodels/tugas_view_model.dart';
import 'package:e_learning_sma_tuna_bangsa/views/tugas/tugas_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TugasPage extends StatefulWidget {
  const TugasPage({super.key});

  @override
  State<TugasPage> createState() => _TugasPageState();
}

class _TugasPageState extends State<TugasPage> {
  void getData(_) {
    context.read<MapelViewModel>().getMapel();
    context.read<TugasViewModel>().getTugas();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(getData);
  }

  @override
  Widget build(BuildContext context) {
    final listTugas = context.watch<TugasViewModel>().listTugas;
    final listMapel = context.watch<MapelViewModel>().listMapel;
    final status = context.watch<TugasViewModel>().status;

    return Column(
      children: [
        Text(
          statusMessage(status),
          style: const TextStyle(color: Colors.grey),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: listTugas.length,
            padding: const EdgeInsets.all(20),
            itemBuilder: (context, index) {
              final tugas = listTugas[index];
              return TugasItem(
                tugas: tugas,
                listMapel: listMapel,
              );
            },
          ),
        ),
      ],
    );
  }

  String statusMessage(TugasStatus status) {
    if (status == TugasStatus.error) return "Gagal mengambil data tugas";
    if (status == TugasStatus.loading) return "Mengambil data tugas...";
    return "";
  }
}
