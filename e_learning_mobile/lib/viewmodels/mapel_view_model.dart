import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learning_sma_tuna_bangsa/models/mapel_model.dart';
import 'package:flutter/material.dart';

class MapelViewModel extends ChangeNotifier {
  final _db = FirebaseFirestore.instance;
  List<MapelModel> _listMapel = [];
  List<MapelModel> get listMapel => _listMapel;
  MapelStatus _status = MapelStatus.normal;
  MapelStatus get status => _status;

  Future getMapel() async {
    _status = MapelStatus.loading;
    notifyListeners();

    try {
      final snapshot = await _db.collection("mapel").get();
      _listMapel =
          snapshot.docs.map((e) => MapelModel.fromSnapshot(e)).toList();
    } catch (e) {
      log(e.toString());
      _status = MapelStatus.error;
      notifyListeners();
      return;
    }

    _status = MapelStatus.normal;
    notifyListeners();
  }
}

enum MapelStatus { normal, loading, error }
