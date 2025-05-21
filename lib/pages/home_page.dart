import 'package:flutter/material.dart';
import '../models/stock.dart';
import '../widgets/stock_card.dart';

final List<Stock> stocks = [
  Stock(symbol: 'AAPL', name: 'Apple', price: 189.65, change: 1.5),
  Stock(symbol: 'GOOG', name: 'Google', price: 2730.12, change: -0.8),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stock Market')),
      body: const Center(
        child: Text('Welcome back'),
      ),
    );
  }
}