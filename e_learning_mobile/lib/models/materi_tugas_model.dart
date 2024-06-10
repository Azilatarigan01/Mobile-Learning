import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learning_sma_tuna_bangsa/models/mapel_model.dart';

class MateriTugasModel {
  final String id;
  final int pertemuan;
  final String judul;
  final String urlDownload;
  final String idMapel;

  MateriTugasModel({
    required this.id,
    required this.pertemuan,
    required this.judul,
    required this.urlDownload,
    required this.idMapel,
  });

  factory MateriTugasModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    return MateriTugasModel(
      id: doc.id,
      pertemuan: doc["pertemuan"],
      judul: doc["judul"],
      urlDownload: doc["url_download"],
      idMapel: doc["id_mapel"],
    );
  }

  String getMapel(List<MapelModel> listMapel) {
    if (listMapel.any((mapel) => mapel.id == idMapel)) {
      final mapelModel = listMapel.firstWhere((guru) => guru.id == idMapel);
      return mapelModel.nama;
    }
    return "";
  }
}
