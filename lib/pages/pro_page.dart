import 'package:flutter/material.dart';

class ProPage extends StatelessWidget {
  const ProPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 35), // distância do topo
    child: Align(
    alignment: Alignment.topCenter,
    child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
          GradientText(
            'Unlock Professional Trading',
            style: const TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
            gradient: const LinearGradient(
              colors: [
                Color(0xFF6A11CB),
                Color(0xFF2575FC),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Take your investment strategy to the next level with advanced analytics, real-\ntime data, and AI-powered insights trusted by professional traders.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      ),
    );
  }
}

class GradientText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Gradient gradient;

  const GradientText(this.text, {super.key, required this.style, required this.gradient});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style.copyWith(color: Colors.white)),
    );
  }
}