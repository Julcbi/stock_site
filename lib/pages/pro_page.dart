import 'package:flutter/material.dart';

class ProPage extends StatelessWidget {
  const ProPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.only(top: 20), // distância do topo
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
      const SizedBox(height: 30), // Espaço antes dos blocos

      ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 700),
        child: GridView.count(
          crossAxisCount: 2, // 2 colunas fixas
          shrinkWrap: true, // importante para GridView dentro de Column
          physics: NeverScrollableScrollPhysics(), // evita scroll interno
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 2.8, // ajuste o valor conforme o tamanho desejado
          children: const [
            FeatureCard(
              icon: Icons.bar_chart,
              title: 'Advanced Analytics',
              description: 'Deep dive into market trends with professional-grade charts and indicators',
            ),
            FeatureCard(
              icon: Icons.notifications_active,
              title: 'Real-time Alerts',
              description: 'Get instant notifications for price movements, news, and market events',
            ),
            FeatureCard(
              icon: Icons.shield,
              title: 'Premium Data',
              description: 'Access to institutional-grade market data and research reports',
            ),
            FeatureCard(
              icon: Icons.bolt,
              title: 'AI Insights',
              description: 'Powered by machine learning algorithms for smarter investment decisions',
            ),
            FeatureCard(
              icon: Icons.trending_up,
              title: 'Portfolio Optimization',
              description: 'Advanced portfolio management tools and risk analysis',
            ),
            FeatureCard(
              icon: Icons.verified_user,
              title: 'Priority Support',
              description: '24/7 premium customer support with dedicated account manager',
            ),
          ],
        ),
      )
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

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const FeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 6),
                Text(description,
                    style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
