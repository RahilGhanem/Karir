import 'package:flutter/material.dart';
import 'dart:async';

class CheckEmailPage extends StatelessWidget {
  const CheckEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBE3F5), // Lighter purple background
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    spreadRadius: 2,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Email Icon
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFEBE3F5), // Light purple
                    ),
                    child: const Icon(
                      Icons.email_outlined,
                      color: Color(0xFF785CCB), // Darker purple
                      size: 40,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Title
                  const Text(
                    'Check Your Email',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Subtitle
                  const Text(
                    "We've sent a verification link to your email address",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Animated Dots
                  const WaitingDotsIndicator(),
                  const SizedBox(height: 8),
                  const Text(
                    "Waiting for verification...",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const SizedBox(height: 40),

                  // Resend Button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.refresh),
                      label: const Text('Resend Verification Email'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        foregroundColor: Colors.black87,
                        side: BorderSide(color: Colors.grey.shade300),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // "Try different email" Link
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      text: "Didn't receive the email? Check your spam folder or\n",
                      style: TextStyle(color: Colors.grey, height: 1.5),
                      children: [
                        TextSpan(
                          text: 'Try a different email',
                          style: TextStyle(
                            color: Color(0xFF8A6AED),
                            fontWeight: FontWeight.bold,
                          ),
                          // recognizer: TapGestureRecognizer()..onTap = () { ... }
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Custom animated dots widget
class WaitingDotsIndicator extends StatefulWidget {
  const WaitingDotsIndicator({super.key});

  @override
  State<WaitingDotsIndicator> createState() => _WaitingDotsIndicatorState();
}

class _WaitingDotsIndicatorState extends State<WaitingDotsIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    final List<Interval> intervals = [
      const Interval(0.0, 0.5),
      const Interval(0.2, 0.7),
      const Interval(0.4, 0.9),
    ];

    _animations = List.generate(3, (index) {
      return Tween<double>(begin: 0.0, end: -8.0).animate(
        CurvedAnimation(
          parent: _controller,
          curve: intervals[index],
        ),
      );
    });

    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            return Transform.translate(
              offset: Offset(0, _animations[index].value),
              child: _buildDot(index),
            );
          }),
        );
      },
    );
  }

  Widget _buildDot(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: Color.lerp(
            const Color(0xFFABA0F9), const Color(0xFF785CCB), index / 2),
        shape: BoxShape.circle,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}