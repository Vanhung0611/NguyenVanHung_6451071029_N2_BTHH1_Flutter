import 'package:flutter/material.dart';
import '../../app/router.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/login_button.dart';
import '../widgets/google_signin_button.dart';
import '../auth/presentation/controllers/auth_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _controller = AuthController();
  bool _rememberMe = false;

  @override
  void dispose() {
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
                'Welcome Back',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF130160),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing\nelit, sed do eiusmod tempor',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF524B6B),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 40),
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
                        style: TextStyle(fontSize: 13, color: Colors.grey),
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
              LoginButton(onTap: () async {
                final success = await _controller.signIn(
                  _emailController.text.trim(),
                  _passwordController.text.trim(),
                );
                if (!mounted) return;
                if (success) {
                  Navigator.pushReplacementNamed(context, AppRouter.successfully);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(_controller.errorMessage ?? 'Lỗi')),
                  );
                }
              }),
              const SizedBox(height: 16),
              GoogleSignInButton(onTap: () async {
                final success = await _controller.signInWithGoogle();
                if (success) {
                  Navigator.pushReplacementNamed(context, AppRouter.successfully);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(_controller.errorMessage ?? 'Lỗi')),
                  );
                }
              }),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "You don't have an account yet? ",
                    style: TextStyle(fontSize: 13, color: Color(0xFF524B6B)),
                  ),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, AppRouter.signup),
                    child: const Text(
                      'Sign up',
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