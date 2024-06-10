import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learning_sma_tuna_bangsa/models/materi_tugas_model.dart';
import 'package:flutter/material.dart';

class MateriViewModel extends ChangeNotifier {
  final _db = FirebaseFirestore.instance;
  List<MateriTugasModel> _listMateri = [];
  List<MateriTugasModel> get listMateri => _listMateri;
  MateriStatus _status = MateriStatus.normal;
  MateriStatus get status => _status;

  Future getMateri() async {
    _status = MateriStatus.loading;
    notifyListeners();

    try {
      final snapshot = await _db.collection("materi").get();
      _listMateri =
          snapshot.docs.map((e) => MateriTugasModel.fromSnapshot(e)).toList();
    } catch (e) {
      log(e.toString());
      _status = MateriStatus.error;
      notifyListeners();
      return;
    }

    _status = MateriStatus.normal;
    notifyListeners();
  }
}

enum MateriStatus { normal, loading, error }
