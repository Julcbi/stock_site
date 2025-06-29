import 'package:flutter/material.dart';
import '../data/mock_stock_details.dart';

class StockDetailPage extends StatelessWidget {
  final String symbol;

  const StockDetailPage({super.key, required this.symbol});

  @override
  Widget build(BuildContext context) {
    final stock = mockStockDetails[symbol];

    if (stock == null) {
      return Scaffold(
        appBar: AppBar(title: const Text("Stock Detail")),
        body: const Center(child: Text("Stock data not found")),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('${stock.symbol} - ${stock.company}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(
              '\$${stock.price.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Text(
              '${stock.isUp ? '+' : '-'}\$${stock.changeValue} (${stock.changePercent}%)',
              style: TextStyle(
                color: stock.isUp ? Colors.green : Colors.red,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),

            Text(
              stock.description,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 32),

            const Text(
              'Price Chart',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: stock.chartData.length,
                itemBuilder: (context, index) {
                  final value = stock.chartData[index];
                  return Container(
                    width: 40,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: value, // mock scale
                      width: 20,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
