import 'package:e_learning_sma_tuna_bangsa/utils/app_constants.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function() onPressed;
  final Color color;
  final String text;
  final double fontSize;
  final bool loading;

  const MyButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.color = AppConstants.primary,
    this.fontSize = 16,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: !loading ? onPressed : null,
      color: color,
      minWidth: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
      disabledColor: color.withOpacity(.3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: fontSize,
              ),
            ),
          ),
          loading
              ? const SizedBox(
                  height: 25,
                  width: 25,
                  child: CircularProgressIndicator(strokeWidth: 3),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
