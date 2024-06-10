import 'package:e_learning_sma_tuna_bangsa/viewmodels/auth_view_model.dart';
import 'package:e_learning_sma_tuna_bangsa/views/layouts/main_layout.dart';
import 'package:e_learning_sma_tuna_bangsa/views/welcome/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({super.key});

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  void initState() {
    super.initState();
    if (FirebaseAuth.instance.currentUser != null) {
      final email = FirebaseAuth.instance.currentUser!.email!;
      context.read<AuthViewModel>().getProfil(email);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const MainLayout();
        }
        return const WelcomePage();
      },
    );
  }
}
