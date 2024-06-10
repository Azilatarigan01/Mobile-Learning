import 'package:e_learning_sma_tuna_bangsa/utils/app_constants.dart';
import 'package:e_learning_sma_tuna_bangsa/viewmodels/auth_view_model.dart';
import 'package:e_learning_sma_tuna_bangsa/views/widgets/my_button.dart';
import 'package:e_learning_sma_tuna_bangsa/views/widgets/my_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _nisnController = TextEditingController();
  final _passwordController = TextEditingController();
  AuthViewModel get _viewModel => context.watch<AuthViewModel>();
  String _error = "";
  AuthStatus get _status => _viewModel.status;
  String get _nisn => _nisnController.text;
  String get _password => _passwordController.text;

  bool checkError() {
    if (_nisn.isEmpty) {
      setState(() => _error = "NISN tidak boleh kosong");
      return false;
    }
    if (_password.isEmpty) {
      setState(() => _error = "Password tidak boleh kosong");
      return false;
    }

    return true;
  }

  void submitSignIn() async {
    if (checkError()) {
      await context.read<AuthViewModel>().signin(_nisn, _password);
      setState(() => _error = context.read<AuthViewModel>().error);
      if (_error == "") Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppConstants.background,
        title: const Text(
          "Masuk",
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
                controller: _nisnController,
                icon: SvgPicture.asset("assets/icons/ic_email.svg"),
                hint: "NISN",
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              MyInput(
                controller: _passwordController,
                icon: SvgPicture.asset("assets/icons/ic_password.svg"),
                hint: "Password",
                isPassword: true,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, "/lupa_password"),
                  child: const Text(
                    "forgot password?",
                    style: TextStyle(color: AppConstants.primary),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              MyButton(
                onPressed: submitSignIn,
                text: "Masuk",
                loading: _status == AuthStatus.loading,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
