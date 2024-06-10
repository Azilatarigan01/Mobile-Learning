import 'package:cloud_firestore/cloud_firestore.dart';

class SiswaModel {
  final String nisn;
  final String email;
  final String nama;
  final String jurusan;
  final String guru;
  final String kelas;
  final String telepon;

  SiswaModel({
    required this.nisn,
    required this.email,
    required this.nama,
    required this.jurusan,
    required this.guru,
    required this.kelas,
    required this.telepon,
  });

  factory SiswaModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> doc,
    String guru,
  ) {
    return SiswaModel(
      nisn: doc.id,
      email: doc["email"],
      nama: doc["nama"],
      jurusan: doc["jurusan"],
      guru: guru,
      kelas: doc["kelas"],
      telepon: doc["telepon"],
    );
  }
}
