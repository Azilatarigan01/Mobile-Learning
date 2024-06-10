import 'package:cloud_firestore/cloud_firestore.dart';

import 'mapel_model.dart';

class GuruModel {
  final String nama;
  final String gambar;
  final String idMapel;
  final String panggilan;

  GuruModel({
    required this.nama,
    required this.gambar,
    required this.idMapel,
    required this.panggilan,
  });

  factory GuruModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    return GuruModel(
      nama: doc["nama"],
      gambar: doc["gambar"],
      idMapel: doc["id_mapel"],
      panggilan: doc["panggilan"],
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
