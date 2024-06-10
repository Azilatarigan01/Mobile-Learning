import 'package:e_learning_sma_tuna_bangsa/viewmodels/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () => context.read<AuthViewModel>().logout(),
          child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              children: [
                SvgPicture.asset("assets/icons/ic_logout.svg"),
                const SizedBox(width: 20),
                const Text(
                  "Log Out",
                  style: TextStyle(
                    color: Color(0xFF091F44),
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
