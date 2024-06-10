import 'package:e_learning_sma_tuna_bangsa/views/widgets/my_button.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.png", width: 180),
            const SizedBox(height: 30),
            const Text(
              "SMA TUNA BANGSA",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
            ),
            const Text(
              "Empowering Minds, Enriching Futures",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            const SizedBox(height: 60),
            MyButton(
              onPressed: () => Navigator.pushNamed(context, "/signin"),
              text: "Masuk",
            ),
          ],
        ),
      ),
    );
  }
}
