import 'package:flutter/material.dart';

class BackrgroundLayer extends StatelessWidget {
  const BackrgroundLayer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: ColoredBox(
        color: Color(0xFFCFEAFE),
      ),
    );
  }
}
