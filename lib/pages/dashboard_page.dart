import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 35), // distância do topo
    child: Align(
    alignment: Alignment.topCenter,
    child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [Color(0xFF6A11CB), Color(0xFF6A11CB)]
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.trending_up, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 10),
            const GradientText(
                'Invisto',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                gradient: LinearGradient(
                    colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
                ),
           ),
          ],
        ),
        const SizedBox(height: 30),
          GradientText(
            'Welcome to',
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
          GradientText(
            'Invisto',
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
            'Your intelligent stock market companion.\nTrack, analyze, and invest with confidence.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.location_on_outlined, color: Colors.grey, size: 18),
              SizedBox(width: 6),
              Text(
                'Global Markets',
                style: TextStyle(color: Colors.grey),
              ),
            ],
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

