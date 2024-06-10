import 'package:e_learning_sma_tuna_bangsa/views/beranda/background_layer.dart';
import 'package:e_learning_sma_tuna_bangsa/views/beranda/main_layer.dart';
import 'package:e_learning_sma_tuna_bangsa/views/beranda/welcome_layer.dart';
import 'package:flutter/material.dart';

class BerandaPage extends StatelessWidget {
  final Function(int index) changePage;
  const BerandaPage({super.key, required this.changePage});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackrgroundLayer(),
        const WelcomeLayer(),
        MainLayer(changePage: changePage),
      ],
    );
  }
}
