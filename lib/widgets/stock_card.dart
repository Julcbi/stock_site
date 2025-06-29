import 'package:flutter/material.dart';
import '../models/stock.dart';
import '../pages/stock_detail_page.dart';

class StockCard extends StatelessWidget {
  final Stock stock;

  const StockCard({super.key, required this.stock});

  @override
  Widget build(BuildContext context) {
    final isUp = stock.changeValue >= 0;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => StockDetailPage(symbol: stock.symbol),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(2, 2),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(stock.symbol, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text(stock.company, style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 12),
            Text('\$${stock.price.toStringAsFixed(2)}',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
            const SizedBox(height: 4),
            Text(
              '${isUp ? '+' : '-'}\$${stock.changeValue.abs().toStringAsFixed(2)}',
              style: TextStyle(
                color: isUp ? Colors.green : Colors.red,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: isUp ? Colors.green.shade50 : Colors.red.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '${isUp ? '+' : '-'}${stock.changePercent.abs().toStringAsFixed(2)}%',
                    style: TextStyle(
                      color: isUp ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox.shrink(),
                Icon(
                  isUp ? Icons.trending_up : Icons.trending_down,
                  color: isUp ? Colors.green.shade200 : Colors.red.shade200,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
