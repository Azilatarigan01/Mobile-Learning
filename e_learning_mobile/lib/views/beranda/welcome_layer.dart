import 'package:e_learning_sma_tuna_bangsa/models/siswa_model.dart';
import 'package:e_learning_sma_tuna_bangsa/viewmodels/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WelcomeLayer extends StatelessWidget {
  const WelcomeLayer({super.key});

  @override
  Widget build(BuildContext context) {
    SiswaModel? user = context.watch<AuthViewModel>().user;
    final namaSiswa = user?.nama ?? "";
    final kelasSiswa = user?.kelas ?? "";
    final nisSiswa = user?.nisn ?? "";

    return SafeArea(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/images/contoh_profil.png",
                    width: 69,
                    height: 69,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Welcome !",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                  ),
                ),
                Text(
                  namaSiswa,
                  style: const TextStyle(fontSize: 12),
                ),
                Text(
                  "$kelasSiswa NIS $nisSiswa",
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, right: 20),
            child: Image.asset(
              "assets/images/beranda.png",
              width: 130,
            ),
          ),
        ],
      ),
    );
  }
}
