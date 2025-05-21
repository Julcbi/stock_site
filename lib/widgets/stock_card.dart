import 'package:flutter/material.dart';
import '../models/stock.dart';

class StockCard extends StatelessWidget {
  final Stock stock;

  const StockCard({super.key, required this.stock});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(stock.name),
        subtitle: Text(stock.symbol),
        trailing: Text('\$${stock.price.toStringAsFixed(2)}'),
      ),
    );
  }
}