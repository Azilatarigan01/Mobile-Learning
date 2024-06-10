import 'package:e_learning_sma_tuna_bangsa/utils/app_constants.dart';
import 'package:flutter/material.dart';

class ResetBerhasilPage extends StatelessWidget {
  const ResetBerhasilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppConstants.primary,
                    width: 5,
                  ),
                ),
                child: const Icon(
                  Icons.mark_email_read_outlined,
                  color: AppConstants.primary,
                  size: 60,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(60, 20, 60, 40),
              child: Text(
                "Email reset password telah terkirim",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                "Kembali",
                style: TextStyle(
                  fontSize: 16,
                  color: AppConstants.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
