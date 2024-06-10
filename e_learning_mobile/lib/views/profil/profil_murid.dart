import 'package:e_learning_sma_tuna_bangsa/models/siswa_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'data_murid.dart';

class ProfilMurid extends StatelessWidget {
  final SiswaModel user;
  const ProfilMurid({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "assets/images/contoh_profil.png",
              width: 80,
              height: 80,
            ),
          ),
          DataMurid(user: user),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/ic_edit.svg",
            ),
          ),
        ],
      ),
    );
  }
}
