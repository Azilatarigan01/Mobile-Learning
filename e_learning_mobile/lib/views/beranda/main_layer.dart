import 'package:e_learning_sma_tuna_bangsa/views/beranda/nav_item.dart';
import 'package:flutter/material.dart';

import 'title_container.dart';

class MainLayer extends StatelessWidget {
  final Function(int index) changePage;
  const MainLayer({super.key, required this.changePage});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 410,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            const TitleContainer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NavItem(
                  color: const Color(0xFFE4F8EB),
                  text: "Homework",
                  onPressed: () => changePage(2),
                ),
                const NavItem(
                  color: Color(0xFFF8E4F5),
                  text: "Subject",
                  route: "/mapel",
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NavItem(
                  color: Color(0xFFE4ECF8),
                  text: "Exam",
                  route: "/ujian",
                ),
                NavItem(
                  color: Color(0xFFF8F6E4),
                  text: "Teacher",
                  route: "/guru",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
