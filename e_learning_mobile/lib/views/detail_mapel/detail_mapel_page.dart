import 'package:e_learning_sma_tuna_bangsa/models/mapel_model.dart';
import 'package:e_learning_sma_tuna_bangsa/utils/app_constants.dart';
import 'package:e_learning_sma_tuna_bangsa/viewmodels/materi_view_model.dart';
import 'package:e_learning_sma_tuna_bangsa/viewmodels/tugas_view_model.dart';
import 'package:e_learning_sma_tuna_bangsa/views/detail_mapel/materi_tugas_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailMapelPage extends StatefulWidget {
  const DetailMapelPage({super.key});

  @override
  State<DetailMapelPage> createState() => _DetailMapelPageState();
}

class _DetailMapelPageState extends State<DetailMapelPage> {
  void getData(_) {
    context.read<MateriViewModel>().getMateri();
    context.read<TugasViewModel>().getTugas();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(getData);
  }

  @override
  Widget build(BuildContext context) {
    final mapel = ModalRoute.of(context)!.settings.arguments as MapelModel;

    final allMateri = context.watch<MateriViewModel>().listMateri;
    final filteredMateri = allMateri.where((materi) {
      return materi.idMapel == mapel.id;
    }).toList();

    final allTugas = context.watch<TugasViewModel>().listTugas;
    final filteredTugas = allTugas.where((tugas) {
      return tugas.idMapel == mapel.id;
    }).toList();

    final materiStatus = context.watch<MateriViewModel>().status;
    final tugasStatus = context.watch<TugasViewModel>().status;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppConstants.background,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          mapel.nama,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  statusMessage(tugasStatus, materiStatus),
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
              const Text(
                "Subject Mater",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: filteredMateri.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final materi = filteredMateri[index];
                  return MateriTugasItem(
                    materiTugas: materi,
                    tipeModel: TipeModel.materi,
                  );
                },
              ),
              const SizedBox(height: 30),
              const Text(
                "Homework",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: filteredTugas.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final tugas = filteredTugas[index];
                  return MateriTugasItem(
                    materiTugas: tugas,
                    tipeModel: TipeModel.tugas,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  String statusMessage(TugasStatus tugasStatus, MateriStatus materiStatus) {
    if (tugasStatus == TugasStatus.error) {
      return "Gagal mengambil data tugas";
    }
    if (materiStatus == MateriStatus.error) {
      return "Gagal mengambil data materi";
    }
    if (tugasStatus == TugasStatus.error &&
        materiStatus == MateriStatus.error) {
      return "Gagal mengambil data materi & tugas";
    }

    if (tugasStatus == TugasStatus.loading ||
        materiStatus == MateriStatus.loading) {
      return "Mengambil data materi & tugas...";
    }
    return "";
  }
}
