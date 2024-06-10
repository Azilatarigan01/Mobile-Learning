import 'package:e_learning_sma_tuna_bangsa/utils/app_constants.dart';
import 'package:e_learning_sma_tuna_bangsa/viewmodels/auth_view_model.dart';
import 'package:e_learning_sma_tuna_bangsa/views/widgets/my_button.dart';
import 'package:e_learning_sma_tuna_bangsa/views/widgets/my_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class LupaPasswordPage extends StatefulWidget {
  const LupaPasswordPage({super.key});

  @override
  State<LupaPasswordPage> createState() => _LupaPasswordPageState();
}

class _LupaPasswordPageState extends State<LupaPasswordPage> {
  final _emailController = TextEditingController();
  AuthViewModel get _viewModel => context.watch<AuthViewModel>();
  AuthStatus get _status => _viewModel.status;
  String get _email => _emailController.text;
  String _error = "";

  void submitReset() async {
    if (_emailController.text.isEmpty) {
      setState(() => _error = "Email tidak boleh kosong");
      return;
    }

    await context.read<AuthViewModel>().resetPassword(_email);
    print(context.read<AuthViewModel>().error);
    setState(() => _error = context.read<AuthViewModel>().error);
    if (_error == "") {
      Navigator.pushReplacementNamed(
        context,
        "/reset_berhasil",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppConstants.background,
        title: const Text(
          "Lupa Password",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  _error,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
              MyInput(
                controller: _emailController,
                icon: SvgPicture.asset("assets/icons/ic_email.svg"),
                hint: "Email",
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 30),
              MyButton(
                onPressed: submitReset,
                text: "Reset",
                loading: _status == AuthStatus.loading,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
