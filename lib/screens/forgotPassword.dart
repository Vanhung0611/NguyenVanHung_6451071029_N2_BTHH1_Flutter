import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../app/router.dart';
import '../widgets/custom_textfield.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

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
                'Forgot Password?',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'To reset your password, you need your email or mobile\nnumber that can be authenticated',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFF524B6B),
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 40),

              SvgPicture.asset(
                'assets/images/forgotPassword.svg',
                height: 180,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 48),

              CustomTextField(
                label: 'Email',
                hint: 'Brandonelouis@gmail.com',
                controller: _emailController,
              ),

              const SizedBox(height: 24),

              // Nút Reset Password
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(
                    context,
                    AppRouter.checkYourEmail,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF130160),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'RESET PASSWORD',
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
            ],
          ),
        ),
      ),
    );
  }
}