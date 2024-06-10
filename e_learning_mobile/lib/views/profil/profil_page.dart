import 'package:e_learning_sma_tuna_bangsa/models/siswa_model.dart';
import 'package:e_learning_sma_tuna_bangsa/viewmodels/auth_view_model.dart';
import 'package:e_learning_sma_tuna_bangsa/views/profil/logout_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'info_profil.dart';
import 'profil_murid.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    SiswaModel user = context.read<AuthViewModel>().user!;
    final jurusan = user.jurusan;
    final waliKelas = user.guru;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfilMurid(user: user),
              InfoProfil(judul: "Jurusan", body: jurusan),
              InfoProfil(judul: "Wali Kelas", body: waliKelas),
              const SizedBox(height: 60),
              const LogoutButton(),
            ],
          ),
        ),
      ),
    );
  }
}
