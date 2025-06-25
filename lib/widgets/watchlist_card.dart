import 'package:flutter/material.dart';
import '../models/watch_item.dart';

class WatchlistCard extends StatelessWidget {
  final WatchItem item;

  const WatchlistCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final Color changeColor = item.isGain ? Colors.green : Colors.red;
    final String changeText = '${item.isGain ? '+' : '-'}${item.percentChange.abs().toStringAsFixed(2)}%';

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.symbol, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(item.company, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('\$${item.currentPrice.toStringAsFixed(2)}',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Text(changeText, style: TextStyle(color: changeColor)),
            ],
          )
        ],
      ),
    );
  }
}
