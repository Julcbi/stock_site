import 'package:flutter/material.dart';
import '../data/mock_portfolio.dart';
import '../widgets/PerformanceTab.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {

    final double totalValue = mockHoldings.fold(0, (sum, h) => sum + h.totalValue);
    final double totalGain = mockHoldings.fold(0, (sum, h) => sum + h.gainLoss);
    final double totalCost = mockHoldings.fold(0, (sum, h) => sum + (h.avgPrice * h.shares));
    final double percentGain = totalCost > 0 ? (totalGain / totalCost) * 100 : 0;
    final int holdingsCount = mockHoldings.length;

    return DefaultTabController(
    length: 2,
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 20),
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                GradientText(
                  'Your',
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
                  ),
                ),
                GradientText(
                  'Portfolio',
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Track your investments and monitor your portfolio performance.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 30),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      PortfolioStatCard(
                        label: 'Total Value',
                        value: '\$${totalValue.toStringAsFixed(2)}',
                        subtext: 'Portfolio value',
                        icon: Icons.attach_money,
                      ),
                      const SizedBox(width: 16),
                      PortfolioStatCard(
                        label: 'Total Gain/Loss',
                        value: '${totalGain >= 0 ? '+' : '-'}\$${totalGain.abs().toStringAsFixed(2)}',
                        subtext: '${percentGain >= 0 ? '+' : '-'}${percentGain.abs().toStringAsFixed(2)}%',
                        valueColor: totalGain >= 0 ? Colors.green : Colors.red,
                        icon: Icons.percent,
                      ),
                      const SizedBox(width: 16),
                      PortfolioStatCard(
                        label: 'Holdings',
                        value: '$holdingsCount',
                        subtext: 'Active positions',
                        icon: Icons.track_changes,
                      ),

    ],
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const TabBar(
                    indicatorColor: Color(0xFF6A11CB),
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(text: 'Holdings'),
                      Tab(text: 'Performance'),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // 👉 Aqui está a grande diferença: o conteúdo das abas está dentro da mesma rolagem
                const _TabContent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TabContent extends StatelessWidget {
  const _TabContent();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700,
      child: TabBarView(
        children: [
          // Holdings
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: mockHoldings.length,
            itemBuilder: (context, index) {
              final holding = mockHoldings[index];
              return Column(
                children: [
                  HoldingCard(
                    ticker: holding.symbol,
                    company: holding.company,
                    shares: holding.shares,
                    avgPrice: holding.avgPrice,
                    currentPrice: holding.currentPrice,
                    totalGain: holding.gainLoss,
                    percentGain: holding.gainLossPercent,
                  ),
                  const SizedBox(height: 12),
                ],
              );
            },
          ),

          // Performance (🔥 aqui está sua nova aba)
          const PerformanceTab(),
        ],
      ),
    );
  }
}



// GradientText
class GradientText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Gradient gradient;

  const GradientText(this.text, {
    super.key,
    required this.style,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) =>
          gradient.createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
      child: Text(text, style: style.copyWith(color: Colors.white)),
    );
  }
}

// Stat Card
class PortfolioStatCard extends StatelessWidget {
  final String label;
  final String value;
  final String? subtext;
  final Color? valueColor;
  final IconData? icon;

  const PortfolioStatCard({
    super.key,
    required this.label,
    required this.value,
    this.subtext,
    this.valueColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: valueColor ?? Colors.black,
                ),
              ),
              const Spacer(),
              if (icon != null) Icon(icon, color: Colors.grey),
            ],
          ),
          if (subtext != null)
            Text(subtext!, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}

// HoldingCard
class HoldingCard extends StatelessWidget {
  final String ticker;
  final String company;
  final int shares;
  final double avgPrice;
  final double currentPrice;
  final double totalGain;
  final double percentGain;

  const HoldingCard({
    super.key,
    required this.ticker,
    required this.company,
    required this.shares,
    required this.avgPrice,
    required this.currentPrice,
    required this.totalGain,
    required this.percentGain,
  });

  @override
  Widget build(BuildContext context) {
    final bool isGain = totalGain >= 0;
    final Color gainColor = isGain ? Colors.green : Colors.red;
    final String gainText = (isGain ? '+\$' : '-\$') + totalGain.abs().toStringAsFixed(2);
    final String percentText = (isGain ? '+' : '-') + percentGain.abs().toStringAsFixed(2) + '%';

    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Esquerda
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(ticker,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(company, style: const TextStyle(color: Colors.grey)),
                Text(
                  '$shares shares @ \$${avgPrice.toStringAsFixed(2)} avg',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          // Direita
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('\$${(shares * currentPrice).toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text('\$${currentPrice.toStringAsFixed(2)} per share',
                  style: const TextStyle(color: Colors.grey)),
              Container(
                margin: const EdgeInsets.only(top: 6),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: gainColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  '$gainText ($percentText)',
                  style: TextStyle(
                      color: gainColor, fontWeight: FontWeight.bold, fontSize: 12),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
