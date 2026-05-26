import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoogleSignInButton extends StatelessWidget {
  final VoidCallback onTap;

  const GoogleSignInButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Color(0xFFE0E0E0)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/icon_google.svg',
              height: 22,
              width: 22,
            ),
            const SizedBox(width: 12),
            const Text(
              'SIGN IN WITH GOOGLE',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}