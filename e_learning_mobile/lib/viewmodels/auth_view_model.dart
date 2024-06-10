import 'dart:developer';

import 'package:e_learning_sma_tuna_bangsa/models/siswa_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthViewModel extends ChangeNotifier {
  final _db = FirebaseFirestore.instance;
  SiswaModel? user;
  AuthStatus _status = AuthStatus.normal;
  AuthStatus get status => _status;
  String _error = "";
  String get error => _error;

  Future signin(String nisn, String password) async {
    _status = AuthStatus.loading;
    _error = "";
    notifyListeners();

    try {
      final siswa = await siswaFromNisn(nisn);
      if (siswa == null) {
        throw FirebaseAuthException(code: "invalid-credential");
      }
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: siswa.email,
        password: password,
      );
      user = siswa;
    } on FirebaseAuthException catch (e) {
      log(e.code);
      log(e.message.toString());
      _error = "Terjadi kesalahan";
      if (e.code == "network-request-failed") _error = "Gagal koneksi";
      if (e.code == "invalid-credential") _error = "NISN atau password salah";
    } catch (e) {
      log(e.toString());
      _error = "Terjadi kesalahan";
    }

    _status = AuthStatus.normal;
    notifyListeners();
  }

  Future logout() async {
    await FirebaseAuth.instance.signOut();
    // TODO: hapus data di local database
  }

  Future resetPassword(String email) async {
    _status = AuthStatus.loading;
    _error = "";
    notifyListeners();

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (e) {
      log(e.toString());
      _error = "Terjadi kesalahan";
    }

    _status = AuthStatus.normal;
    notifyListeners();
  }

  Future getProfil(String email) async {
    final snapshot =
        await _db.collection("siswa").where("email", isEqualTo: email).get();

    if (snapshot.docs.isEmpty) {
      logout();
      return;
    }

    final doc = snapshot.docs.first;
    final guru = await guruFromId(doc["id_guru"]);
    user = SiswaModel.fromSnapshot(doc, guru);
    notifyListeners();
    return;
  }

  Future<SiswaModel?> siswaFromNisn(String nisn) async {
    final snapshot = await _db.collection("siswa").doc(nisn).get();
    if (snapshot.exists) {
      final guru = await guruFromId(snapshot["id_guru"]);
      return SiswaModel.fromSnapshot(snapshot, guru);
    }
    return null;
  }

  Future<String> guruFromId(String? id) async {
    final guruSnapshot = await _db.collection("guru").doc(id).get();
    if (!guruSnapshot.exists) return "";
    return "${guruSnapshot["panggilan"]} ${guruSnapshot["nama"]}";
  }
}

enum AuthStatus { normal, loading }
