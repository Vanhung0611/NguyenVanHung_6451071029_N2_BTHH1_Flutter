import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../app/router.dart';


class CheckYourEmailScreen extends StatelessWidget {
  const CheckYourEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),

              const Text(
                'Check Your Email',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'We have sent the reset password to the email address',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFF524B6B),
                  height: 1.5,
                ),
              ),
              const Text(
                'brandonelouis@gmail.com',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 48),

              SvgPicture.asset(
                'assets/images/checkYourEmail.svg',
                height: 180,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 64),

              // Nút Open Your Email
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, AppRouter.successfully),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF130160),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'OPEN YOUR EMAIL',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Nút Back to Login
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushReplacementNamed(
                    context,
                    AppRouter.login,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEDE8FF),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'BACK TO LOGIN',
                    style: TextStyle(
                      color: Color(0xFF524B6B),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // You have not received the email?
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'You have not received the email?  ',
                    style: TextStyle(fontSize: 13, color: Color(0xFF524B6B)),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Resend',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFFFCA34D),
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFFFCA34D),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}