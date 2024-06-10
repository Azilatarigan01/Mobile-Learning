import 'package:flutter/material.dart';

class MyInput extends StatefulWidget {
  final TextEditingController controller;
  final Widget icon;
  final String hint;
  final bool isPassword;
  final TextInputType keyboardType;

  const MyInput({
    super.key,
    required this.controller,
    required this.icon,
    required this.hint,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  State<MyInput> createState() => _MyInputState();
}

class _MyInputState extends State<MyInput> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: widget.isPassword && !_showPassword,
          style: const TextStyle(fontSize: 15),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFF9FAFB),
            isCollapsed: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 17),
            hintText: widget.hint,
            hintStyle: TextStyle(
              color: Colors.grey.shade400,
              fontWeight: FontWeight.normal,
            ),
            prefixIconConstraints: const BoxConstraints(minWidth: 60),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: widget.icon,
            ),
            prefixIconColor: Colors.grey.shade400,
            enabledBorder: buildBorder(),
            focusedBorder: buildBorder(),
          ),
        ),
        widget.isPassword
            ? Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5, right: 15),
                  child: IconButton(
                    onPressed: () {
                      setState(() => _showPassword = !_showPassword);
                    },
                    icon: Icon(
                      _showPassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      size: 27,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide(color: Colors.grey.shade300),
    );
  }
}
