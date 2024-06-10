import 'package:e_learning_sma_tuna_bangsa/models/materi_tugas_model.dart';
import 'package:e_learning_sma_tuna_bangsa/utils/app_constants.dart';
import 'package:e_learning_sma_tuna_bangsa/viewmodels/downloader_view_model.dart';
import 'package:e_learning_sma_tuna_bangsa/viewmodels/mysql_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MateriTugasItem extends StatefulWidget {
  final MateriTugasModel materiTugas;
  final TipeModel tipeModel;
  const MateriTugasItem({
    super.key,
    required this.materiTugas,
    required this.tipeModel,
  });

  @override
  State<MateriTugasItem> createState() => _MateriTugasItemState();
}

class _MateriTugasItemState extends State<MateriTugasItem> {
  String? _taskId;

  void getTaskId() async {
    final taskId = await MySQLViewModel.taskFromDoc(widget.materiTugas.id);
    setState(() => _taskId = taskId);
  }

  @override
  void initState() {
    super.initState();
    getTaskId();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.black12),
      ),
      child: InkWell(
        onTap: () async {
          final taskId = await DownloaderViewModel.openFile(
              widget.materiTugas.urlDownload, widget.materiTugas.id);
          if (taskId != null) setState(() => _taskId = taskId);
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: AppConstants.primary.withOpacity(.12),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    widget.tipeModel == TipeModel.materi
                        ? "assets/icons/ic_mapel_materi.svg"
                        : "assets/icons/ic_mapel_tugas.svg",
                    height: 25,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pertemuan ${widget.materiTugas.pertemuan}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      widget.materiTugas.judul,
                      style: const TextStyle(
                        fontSize: 12,
                        overflow: TextOverflow.ellipsis,
                        color: Colors.black38,
                      ),
                    ),
                  ],
                ),
              ),
              _taskId == null ? const Icon(Icons.download) : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

enum TipeModel { materi, tugas }
