import 'package:e_learning_sma_tuna_bangsa/utils/app_constants.dart';
import 'package:flutter/material.dart';

class TitleContainer extends StatelessWidget {
  const TitleContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 25,
      ),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppConstants.primary.withOpacity(.08),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "SMA Tuna Bangsa",
            style: TextStyle(
              color: Color(0xFF364B98),
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Empowering Minds, Enriching Futures",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
