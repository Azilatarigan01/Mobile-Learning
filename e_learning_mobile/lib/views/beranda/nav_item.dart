import 'package:flutter/material.dart';

class NavItem extends StatelessWidget {
  final Color color;
  final String text;
  final String? route;
  final Function()? onPressed;

  const NavItem({
    super.key,
    required this.color,
    required this.text,
    this.route,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed ??
          () {
            if (route != null) Navigator.pushNamed(context, route!);
          },
      child: Container(
        height: 60,
        width: 110,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Color(0xFF091F44)),
          ),
        ),
      ),
    );
  }
}
