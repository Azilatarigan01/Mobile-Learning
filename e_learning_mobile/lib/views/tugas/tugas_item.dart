import 'package:e_learning_sma_tuna_bangsa/models/mapel_model.dart';
import 'package:e_learning_sma_tuna_bangsa/models/materi_tugas_model.dart';
import 'package:e_learning_sma_tuna_bangsa/utils/app_constants.dart';
import 'package:e_learning_sma_tuna_bangsa/viewmodels/downloader_view_model.dart';
import 'package:e_learning_sma_tuna_bangsa/viewmodels/mysql_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TugasItem extends StatefulWidget {
  final MateriTugasModel tugas;
  final List<MapelModel> listMapel;

  const TugasItem({
    super.key,
    required this.tugas,
    required this.listMapel,
  });

  @override
  State<TugasItem> createState() => _TugasItemState();
}

class _TugasItemState extends State<TugasItem> {
  String? _taskId;

  void getTaskId() async {
    final taskId = await MySQLViewModel.taskFromDoc(widget.tugas.id);
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
        onTap: () {
          DownloaderViewModel.openFile(
              widget.tugas.urlDownload, widget.tugas.id);
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
                    "assets/icons/ic_mapel_tugas.svg",
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
                      widget.tugas.getMapel(widget.listMapel),
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      widget.tugas.judul,
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
