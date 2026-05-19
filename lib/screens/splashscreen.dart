import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../app/router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tên app góc phải
              const Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Text(
                    'Jobspot',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 100),

              // Hình minh họa SVG (bỏ viền)
              SizedBox(
                width: double.infinity,
                height: 320,
                child: SvgPicture.asset(
                  'assets/images/splashscreen.svg',
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 60),


              // Tiêu đề
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    height: 1.2,
                  ),
                  children: [
                    TextSpan(text: 'Find Your\n'),
                    TextSpan(
                      text: 'Dream Job\n',
                      style: TextStyle(
                        color: Color(0xFFFCA34D),
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFFFCA34D),
                        decorationThickness: 2,
                        decorationStyle: TextDecorationStyle.solid,
                        shadows: [
                          Shadow(
                            color: Colors.transparent,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                    ),
                    TextSpan(text: 'Here!'),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Mô tả
              const Text(
                'Explore all the most exciting job roles based\non your interest and study major.',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  height: 1.6,
                ),
              ),

              const Spacer(),

              // Nút mũi tên — chỉ navigate khi nhấn
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 32.0),
                  child: GestureDetector(
                    onTap: () => Navigator.pushReplacementNamed(
                      context,
                      AppRouter.login,
                    ),
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: const BoxDecoration(
                        color: Color(0xFF130160),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 26,
                      ),
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