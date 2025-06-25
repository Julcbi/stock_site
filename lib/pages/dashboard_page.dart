import 'package:flutter/material.dart';
import '../data/mock_stocks.dart';
import '../widgets/stock_card.dart';
import '../models/stock.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Título
          const GradientText(
            'Welcome to',
            style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            gradient: LinearGradient(colors: [Color(0xFF6A11CB), Color(0xFF2575FC)]),
          ),
          const GradientText(
            'Invisto',
            style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            gradient: LinearGradient(colors: [Color(0xFF6A11CB), Color(0xFF2575FC)]),
          ),
          const SizedBox(height: 20),

          const Text(
            'Your intelligent stock market companion.\nTrack, analyze, and invest with confidence.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),

          const SizedBox(height: 16),
          const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.location_on_outlined, color: Colors.grey, size: 18),
              SizedBox(width: 6),
              Text('Global Markets', style: TextStyle(color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 24),

          // Search bar
          SizedBox(
            width: 300,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search stocks...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Cards do topo (índices)
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 16,
            runSpacing: 16,
            children: indexCards.map((stock) => SizedBox(
              width: 200, // 🔥 define a largura ideal para caber lado a lado
              child: StockCard(stock: stock),
            )).toList(),
          ),


          const SizedBox(height: 32),

          // Top Gainers e Top Losers
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _buildStockGroup('📈 Top Gainers', topGainers),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildStockGroup('📉 Top Losers', topLosers),
              ),
            ],
          ),

          const SizedBox(height: 32),

          // Título "Market Stocks"
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Market Stocks',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: GridView.builder(
              shrinkWrap: true, // ✅ permite altura dinâmica
              physics: const NeverScrollableScrollPhysics(), // ✅ scroll é controlado pelo SingleChildScrollView
              itemCount: marketStocks.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 2.1,
              ),
              itemBuilder: (context, index) {
                return StockCard(stock: marketStocks[index]);
              },
            ),
          ),


        ],
      ),
    );
  }

  Widget _buildStockGroup(String title, List<Stock> stocks) {
    return SizedBox(
      height: 240,
      child: Card(
        color: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              ...stocks.take(3).map((stock) => _StockItem(
                name: stock.symbol,
                company: stock.company,
                price: '\$${stock.price.toStringAsFixed(2)}',
                change: '${stock.changePercent >= 0 ? '+' : ''}${stock.changePercent.toStringAsFixed(2)}%',
                isLoss: !stock.isUp,
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class _StockItem extends StatelessWidget {
  final String name;
  final String company;
  final String price;
  final String change;
  final bool isLoss;

  const _StockItem({
    required this.name,
    required this.company,
    required this.price,
    required this.change,
    this.isLoss = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(company, style: const TextStyle(color: Colors.grey)),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(
                change,
                style: TextStyle(color: isLoss ? Colors.red : Colors.green),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// GradientText reutilizável
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
