import 'package:e_learning_sma_tuna_bangsa/models/guru_model.dart';
import 'package:e_learning_sma_tuna_bangsa/models/mapel_model.dart';
import 'package:e_learning_sma_tuna_bangsa/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MapelItem extends StatelessWidget {
  final MapelModel mapel;
  final List<GuruModel> listGuru;

  const MapelItem({
    super.key,
    required this.mapel,
    required this.listGuru,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.black12),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(
          context,
          "/detail_mapel",
          arguments: mapel,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                height: 80,
                width: 60,
                decoration: BoxDecoration(
                  color: AppConstants.primary.withOpacity(.12),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: SvgPicture.asset("assets/icons/ic_mapel.svg"),
                ),
              ),
              const SizedBox(width: 15),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mapel.nama,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    mapel.getGuru(listGuru),
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black38,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
