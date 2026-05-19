import 'package:flutter/material.dart';
import 'package:nguyenvanhung_6451071029_th1/screens/checkYourEmail.dart';
import 'package:nguyenvanhung_6451071029_th1/screens/forgotPassword.dart';
import 'package:nguyenvanhung_6451071029_th1/screens/logo.dart';
import 'package:nguyenvanhung_6451071029_th1/screens/successfully.dart';
import '../screens/login.dart';
import '../screens/signup.dart';
import '../screens/splashscreen.dart';

class AppRouter {
  static const String logo           = '/';
  static const String splash         = '/splash';
  static const String login          = '/login';
  static const String signup         = '/signup';
  static const String forgotPassword = '/forgot-password';
  static const String checkYourEmail = '/check-your-email';
  static const String successfully   = '/successfully';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case logo:
        return MaterialPageRoute(builder: (_) => const LogoScreen());
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case signup:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case checkYourEmail:
        return MaterialPageRoute(builder: (_) => const CheckYourEmailScreen());
      case successfully:
        return MaterialPageRoute(builder: (_) => const SuccessfullyScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route: ${settings.name}')),
          ),
        );
    }
  }
}