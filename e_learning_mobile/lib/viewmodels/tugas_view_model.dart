import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learning_sma_tuna_bangsa/models/materi_tugas_model.dart';
import 'package:flutter/material.dart';

class TugasViewModel extends ChangeNotifier {
  final _db = FirebaseFirestore.instance;
  List<MateriTugasModel> _listTugas = [];
  List<MateriTugasModel> get listTugas => _listTugas;
  TugasStatus _status = TugasStatus.normal;
  TugasStatus get status => _status;

  Future getTugas() async {
    _status = TugasStatus.loading;
    notifyListeners();

    try {
      final snapshot = await _db.collection("tugas").get();
      _listTugas =
          snapshot.docs.map((e) => MateriTugasModel.fromSnapshot(e)).toList();
    } catch (e) {
      log(e.toString());
      _status = TugasStatus.error;
      notifyListeners();
      return;
    }

    _status = TugasStatus.normal;
    notifyListeners();
  }
}

enum TugasStatus { normal, loading, error }
