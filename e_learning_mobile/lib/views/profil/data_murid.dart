import 'package:e_learning_sma_tuna_bangsa/models/siswa_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DataMurid extends StatelessWidget {
  final SiswaModel user;
  const DataMurid({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              user.nama,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color(0xFF091F44),
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/ic_kelas.svg",
                  ),
                  Text(
                    "${user.kelas} | ${user.nisn}",
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/ic_telepon.svg",
                ),
                Text(
                  user.telepon,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
