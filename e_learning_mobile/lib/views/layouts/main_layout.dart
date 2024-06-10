import 'package:e_learning_sma_tuna_bangsa/utils/app_constants.dart';
import 'package:e_learning_sma_tuna_bangsa/views/beranda/beranda_page.dart';
import 'package:e_learning_sma_tuna_bangsa/views/lokasi/lokasi_page.dart';
import 'package:e_learning_sma_tuna_bangsa/views/profil/profil_page.dart';
import 'package:e_learning_sma_tuna_bangsa/views/tugas/tugas_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  List get _listPages => [
        BerandaPage(changePage: changePage),
        const LokasiPage(),
        const TugasPage(),
        const ProfilPage(),
      ];

  int _currentIndex = 0;

  void changePage(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(_currentIndex),
      body: _listPages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              offset: const Offset(0, -3),
              color: Colors.black.withOpacity(.13),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          showUnselectedLabels: true,
          selectedItemColor: AppConstants.primary,
          unselectedItemColor: Colors.grey.shade500,
          selectedLabelStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          onTap: (index) => setState(() => _currentIndex = index),
          items: [
            buildNavItem(
              svg: "assets/icons/ic_home.svg",
              activeSvg: "assets/icons/ic_home_active.svg",
              label: "Dashboard",
            ),
            buildNavItem(
              svg: "assets/icons/ic_lokasi.svg",
              activeSvg: "assets/icons/ic_lokasi_active.svg",
              label: "Location",
            ),
            buildNavItem(
              svg: "assets/icons/ic_tugas.svg",
              activeSvg: "assets/icons/ic_tugas_active.svg",
              label: "Homework",
            ),
            buildNavItem(
              svg: "assets/icons/ic_profil.svg",
              activeSvg: "assets/icons/ic_profil_active.svg",
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }

  AppBar? _buildAppBar(int index) {
    if (index == 1) {
      return AppBar(
        elevation: 0,
        backgroundColor: AppConstants.background,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "Location",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    } else if (index == 2) {
      return AppBar(
        elevation: 0,
        backgroundColor: AppConstants.background,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "My Homework",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    } else {
      return null; // Sembunyikan app bar untuk indeks yang lain
    }
  }

  BottomNavigationBarItem buildNavItem({
    required String svg,
    required String activeSvg,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 10, top: 10),
        child: SvgPicture.asset(svg),
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.only(bottom: 10, top: 10),
        child: SvgPicture.asset(activeSvg),
      ),
      label: label,
    );
  }
}
