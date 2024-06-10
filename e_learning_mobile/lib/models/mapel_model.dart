import 'package:cloud_firestore/cloud_firestore.dart';

import 'guru_model.dart';

class MapelModel {
  final String id;
  final String nama;

  MapelModel({
    required this.id,
    required this.nama,
  });

  factory MapelModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    return MapelModel(
      id: doc.id,
      nama: doc["nama"],
    );
  }

  String getGuru(List<GuruModel> listGuru) {
    if (listGuru.any((guru) => guru.idMapel == id)) {
      final guruModel = listGuru.firstWhere((guru) => guru.idMapel == id);
      return guruModel.nama;
    }
    return "";
  }
}
