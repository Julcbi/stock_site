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
      ),
      const SizedBox(height: 40), // ✅ Aqui está OK

      // A partir daqui seguem os cards de plano:
      const Text(
        'Choose Your Plan',
        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 8),
      const Text(
        'Start your 14-day free trial. Cancel anytime.',
        style: TextStyle(color: Colors.grey),
      ),
      const SizedBox(height: 24),

      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PricingCard(
              title: 'Invisto Pro',
              price: '\$29.99',
              period: 'month',
              features: [
                'Advanced charting tools',
                'Real-time market data',
                'AI-powered insights',
                'Portfolio optimization',
                'Premium research reports',
                'Priority customer support',
                'Mobile app access',
                'API access for developers',
              ],
            ),
            SizedBox(width: 20),
            PricingCard(
              title: 'Invisto Pro (Yearly)',
              price: '\$299.99',
              period: 'year',
              features: [
                'Advanced charting tools',
                'Real-time market data',
                'AI-powered insights',
                'Portfolio optimization',
                'Premium research reports',
                'Priority customer support',
                'Mobile app access',
                'API access for developers',
                'Save 17%',
              ],
            ),
          ],
        ),
      ),
      const SizedBox(height: 40),

      Text(
        'Trusted by Professionals',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 20),

      Wrap(
        alignment: WrapAlignment.center,
        spacing: 20,
        runSpacing: 20,
        children: [
          TestimonialCard(
            stars: 5,
            text: '"Invisto Pro has transformed how I analyze markets. The AI insights are incredibly accurate."',
            name: 'Sarah Chen',
            role: 'Portfolio Manager',
          ),
          TestimonialCard(
            stars: 5,
            text: '"Real-time alerts have helped me catch opportunities I would have missed otherwise."',
            name: 'Michael Rodriguez',
            role: 'Day Trader',
          ),
          TestimonialCard(
            stars: 5,
            text: '"The advanced analytics give me the edge I need to provide better advice to my clients."',
            name: 'Emily Johnson',
            role: 'Financial Advisor',
          ),
        ],
      ),

      const SizedBox(height: 60),
      const Text(
        'Frequently Asked Questions',
        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 24),

      ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 700),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            FAQItem(
              question: 'Can I cancel my subscription anytime?',
              answer: "Yes, you can cancel your subscription at any time. You'll continue to have access to Pro features until the end of your billing period.",
            ),
            FAQItem(
              question: 'Is there a free trial?',
              answer: 'Yes, we offer a 14-day free trial with full access to all Pro features. No credit card required to start.',
            ),
            FAQItem(
              question: 'What payment methods do you accept?',
              answer: 'We accept all major credit cards, PayPal, and bank transfers for annual subscriptions.',
            ),
            FAQItem(
              question: 'Do you offer refunds?',
              answer: "We offer a 30-day money-back guarantee if you're not satisfied with Invisto Pro.",
            ),
          ],
        ),
      ),


    ],
      ),
      ),
    );

  }
}
class PricingCard extends StatelessWidget {
  final String title;
  final String price;
  final String period;
  final List<String> features;
  final VoidCallback? onPressed;

  const PricingCard({
    super.key,
    required this.title,
    required this.price,
    required this.period,
    required this.features,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.deepPurpleAccent),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 12),
          Center(
            child: Text.rich(
              TextSpan(
                text: price,
                style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: '/$period',
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          ...features.map((f) => Row(
            children: [
              const Icon(Icons.check, color: Colors.green, size: 20),
              const SizedBox(width: 8),
              Expanded(child: Text(f)),
            ],
          )),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: onPressed ?? () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
                foregroundColor: Colors.white,
              ),
              child: const Text('Start 14-Day Free Trial'),
            ),
          )
        ],
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

class TestimonialCard extends StatelessWidget {
  final int stars;
  final String text;
  final String name;
  final String role;

  const TestimonialCard({
    super.key,
    required this.stars,
    required this.text,
    required this.name,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: List.generate(
              stars,
                  (index) => const Icon(Icons.star, color: Colors.amber, size: 20),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            text,
            style: const TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            role,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class FAQItem extends StatelessWidget {
  final String question;
  final String answer;

  const FAQItem({
    super.key,
    required this.question,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            answer,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
