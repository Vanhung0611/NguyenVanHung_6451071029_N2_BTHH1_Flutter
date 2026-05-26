import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../app/router.dart';
import '../widgets/custom_textfield.dart';
import '../auth/presentation/controllers/auth_controller.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _controller = AuthController();
  bool _rememberMe = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
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
                'Create an Account',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing\nelit, sed do eiusmod tempor',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFF524B6B),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 40),
              CustomTextField(
                label: 'Full name',
                hint: 'Brandone Louis',
                controller: _nameController,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                label: 'Email',
                hint: 'Brandonelouis@gmail.com',
                controller: _emailController,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                label: 'Password',
                hint: '••••••••••',
                controller: _passwordController,
                isPassword: true,
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _rememberMe,
                        onChanged: (val) =>
                            setState(() => _rememberMe = val ?? false),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        activeColor: const Color(0xFF130160),
                      ),
                      const Text(
                        'Remember me',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF524B6B),
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(
                        context, AppRouter.forgotPassword),
                    child: const Text(
                      'Forgot Password ?',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () async {
                    final success = await _controller.signUp(
                      _emailController.text.trim(),
                      _passwordController.text.trim(),
                      _nameController.text.trim(),
                    );
                    if (success) {
                      Navigator.pushNamed(context, AppRouter.checkYourEmail);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content:
                            Text(_controller.errorMessage ?? 'Lỗi')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF130160),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'SIGN UP',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: OutlinedButton.icon(
                  onPressed: () async {
                    final success = await _controller.signInWithGoogle();
                    if (success) {
                      Navigator.pushReplacementNamed(context, AppRouter.home);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content:
                            Text(_controller.errorMessage ?? 'Lỗi')),
                      );
                    }
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color(0xFFEDE8FF),
                    side: BorderSide.none,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  icon: SvgPicture.asset(
                    'assets/images/icon_google.svg',
                    height: 22,
                    width: 22,
                  ),
                  label: const Text(
                    'SIGN UP WITH GOOGLE',
                    style: TextStyle(
                      color: Color(0xFF524B6B),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "You don't have an account yet? ",
                    style: TextStyle(fontSize: 13, color: Color(0xFF524B6B)),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Text(
                      'Sign in',
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