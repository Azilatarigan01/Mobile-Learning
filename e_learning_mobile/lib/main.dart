import 'package:e_learning_sma_tuna_bangsa/utils/app_constants.dart';
import 'package:e_learning_sma_tuna_bangsa/viewmodels/auth_view_model.dart';
import 'package:e_learning_sma_tuna_bangsa/viewmodels/guru_view_model.dart';
import 'package:e_learning_sma_tuna_bangsa/viewmodels/mapel_view_model.dart';
import 'package:e_learning_sma_tuna_bangsa/viewmodels/materi_view_model.dart';
import 'package:e_learning_sma_tuna_bangsa/viewmodels/mysql_view_model.dart';
import 'package:e_learning_sma_tuna_bangsa/viewmodels/tugas_view_model.dart';
import 'package:e_learning_sma_tuna_bangsa/views/auth_check.dart';
import 'package:e_learning_sma_tuna_bangsa/views/detail_mapel/detail_mapel_page.dart';
import 'package:e_learning_sma_tuna_bangsa/views/guru/guru_page.dart';
import 'package:e_learning_sma_tuna_bangsa/views/layouts/main_layout.dart';
import 'package:e_learning_sma_tuna_bangsa/views/lokasi/lokasi_page.dart';
import 'package:e_learning_sma_tuna_bangsa/views/lupa_password/reset_berhasil_page.dart';
import 'package:e_learning_sma_tuna_bangsa/views/lupa_password/lupa_password_page.dart';
import 'package:e_learning_sma_tuna_bangsa/views/mapel/mapel_page.dart';
import 'package:e_learning_sma_tuna_bangsa/views/ujian/ujian_page.dart'; // Import baru
import 'package:e_learning_sma_tuna_bangsa/views/sign_in/sign_in_page.dart';
import 'package:e_learning_sma_tuna_bangsa/views/tugas/tugas_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FlutterDownloader.initialize(
    debug: true,
    ignoreSsl: true,
  );

  final localPath = (await getExternalStorageDirectory())!.path;
  final db = await openDatabase(
    "$localPath/e-learning.db",
    onCreate: MySQLViewModel.migrateTables,
    version: 1,
  );
  MySQLViewModel.db = db;

  runApp(const ELearningApp());
}

class ELearningApp extends StatelessWidget {
  const ELearningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => GuruViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => MapelViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => MateriViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => TugasViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: "Poppins",
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppConstants.primary,
            background: AppConstants.background,
          ),
        ),
        routes: {
          "/": (context) => const AuthCheck(),
          "/signin": (context) => const SignInPage(),
          "/lupa_password": (context) => const LupaPasswordPage(),
          "/reset_berhasil": (context) => const ResetBerhasilPage(),
          "/main": (context) => const MainLayout(),
          "/mapel": (context) => const MapelPage(),
          "/detail_mapel": (context) => const DetailMapelPage(),
          "/tugas": (context) => const TugasPage(),
          "/ujian": (context) => const UjianPage(), // Perbarui rute di sini
          "/guru": (context) => const GuruPage(),
        },
      ),
    );
  }
}
