import '../data/mock_portfolio.dart';
import 'package:flutter/material.dart';



class PerformanceTab extends StatelessWidget {
  const PerformanceTab({super.key});

  @override
  Widget build(BuildContext context) {
    final topPerformers = mockHoldings.where((h) => h.gainLoss >= 0).toList();
    final underPerformers = mockHoldings.where((h) => h.gainLoss < 0).toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      child: IntrinsicHeight(
      child: Row(
      children: [
          // Top Performers
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.trending_up, color: Colors.green),
                      SizedBox(width: 8),
                      Text("Top Performers", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  for (var h in topPerformers)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(h.symbol, style: const TextStyle(fontWeight: FontWeight.bold)),
                              Text('${h.shares} shares', style: const TextStyle(color: Colors.grey)),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('\$${h.totalValue.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold)),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.green.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  '+${h.gainLossPercent.toStringAsFixed(2)}%',
                                  style: const TextStyle(color: Colors.green, fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Underperformers
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.trending_down, color: Colors.red),
                      SizedBox(width: 8),
                      Text("Underperformers", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  for (var h in underPerformers)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(h.symbol, style: const TextStyle(fontWeight: FontWeight.bold)),
                              Text('${h.shares} shares', style: const TextStyle(color: Colors.grey)),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('\$${h.totalValue.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold)),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.red.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  '-${h.gainLossPercent.abs().toStringAsFixed(2)}%',
                                  style: const TextStyle(color: Colors.red, fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
      )
    );
  }
}
