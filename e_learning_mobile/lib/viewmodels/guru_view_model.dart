import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learning_sma_tuna_bangsa/models/guru_model.dart';
import 'package:flutter/material.dart';

class GuruViewModel extends ChangeNotifier {
  final _db = FirebaseFirestore.instance;
  List<GuruModel> _listGuru = [];
  List<GuruModel> get listGuru => _listGuru;
  GuruStatus _status = GuruStatus.normal;
  GuruStatus get status => _status;

  Future getGuru() async {
    _status = GuruStatus.loading;
    notifyListeners();

    try {
      final snapshot = await _db.collection("guru").get();
      _listGuru = snapshot.docs.map((e) => GuruModel.fromSnapshot(e)).toList();
    } catch (e) {
      log(e.toString());
      _status = GuruStatus.error;
      notifyListeners();
      return;
    }

    _status = GuruStatus.normal;
    notifyListeners();
  }
}

enum GuruStatus { normal, loading, error }
