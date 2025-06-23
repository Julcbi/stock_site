import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GradientText(
              'Welcome to',
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
            GradientText(
              'Invisto',
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
              'Your intelligent stock market companion.\nTrack, analyze, and invest with confidence.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 16),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.location_on_outlined, color: Colors.grey, size: 18),
                SizedBox(width: 6),
                Text(
                  'Global Markets',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 24), // Espaço antes dos cards

            SizedBox(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search stocks...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 16,
              runSpacing: 16,
              children: const [
                _StockCard(title: 'S&P 500', value: '4,567.89', change: '+23.45 (+0.52%)', up: true),
                _StockCard(title: 'NASDAQ', value: '14,234.56', change: '-45.67 (-0.32%)', up: false),
                _StockCard(title: 'DOW JONES', value: '34,567.12', change: '+123.45 (+0.36%)', up: true),
                _StockCard(title: 'Market Cap', value: '\$45.2T', change: '+1.21T (+2.7%)', up: true),
              ],
            ),

            const SizedBox(height: 32), // espaço entre o top e os stocks


            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 240, // 🔧 altura fixa para igualar os blocos
                    child: Card(
                      color: Colors.white, // Adiciona fundo branco
                      elevation: 2,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('📈 Top Gainers',style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                            SizedBox(height: 12),
                            StockItem(name: 'AAPL', company: 'Apple Inc.', price: '\$175.43', change: '+1.35%'),
                            StockItem(name: 'MSFT', company: 'Microsoft Corp.', price: '\$378.85', change: '+1.10%'),
                            StockItem(name: 'AMZN', company: 'Amazon.com Inc.', price: '\$3342.88', change: '+0.37%'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: SizedBox(
                    height: 240, // 🔧 mesma altura para alinhamento
                    child: Card(
                      color: Colors.white, // Adiciona fundo branco
                      elevation: 2,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('📉 Top Losers',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                            SizedBox(height: 12),
                            StockItem(name: 'GOOGL', company: 'Alphabet Inc.', price: '\$2847.23', change: '-0.55%', isLoss: true),
                            StockItem(name: 'TSLA', company: 'Tesla Inc.', price: '\$248.50', change: '-3.20%', isLoss: true),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

// Título "Market Stocks"
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Market Stocks',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

// Grid com os cards
            Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 2,
                children: [
                  _buildStockCard('AAPL', 'Apple Inc.', '\$175.43', '+\$2.34', '+1.35%', true, '45.2M'),
                  _buildStockCard('GOOGL', 'Alphabet Inc.', '\$2847.23', '-\$15.67', '-0.55%', false, '1.2M'),
                  _buildStockCard('MSFT', 'Microsoft Corp.', '\$378.85', '+\$4.12', '+1.10%', true, '23.5M'),
                  _buildStockCard('TSLA', 'Tesla Inc.', '\$248.50', '-\$8.23', '-3.20%', false, '34.6M'),
                  _buildStockCard('AMZN', 'Amazon.com Inc.', '\$3342.88', '+\$12.45', '+0.37%', true, '12.3M'),
                  _buildStockCard('NVDA', 'NVIDIA Corp.', '\$875.28', '+\$23.45', '+2.75%', true, '56.8M'),
                ],
              ),
            ),


          ],
        ),

    );
  }
  Widget _buildStockCard(String symbol, String name, String price, String changeValue, String changePercent, bool isUp, String volume) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(symbol, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Text(name, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 8),
          Text(price, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          Text(
            changeValue,
            style: TextStyle(color: changeValue.startsWith('+') ? Colors.green : Colors.red),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: isUp ? Colors.green[50] : Colors.red[50],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  changePercent,
                  style: TextStyle(
                    color: isUp ? Colors.green : Colors.red,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.volume_up, size: 14, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(volume, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              )
            ],
          ),
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

class _StockCard extends StatelessWidget {
  final String title;
  final String value;
  final String change;
  final bool up;

  const _StockCard({
    required this.title,
    required this.value,
    required this.change,
    required this.up,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 8),
          Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(
            change,
            style: TextStyle(
              fontSize: 12,
              color: up ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}

class StockItem extends StatelessWidget {
  final String name;
  final String company;
  final String price;
  final String change;
  final bool isLoss;

  const StockItem({
    super.key,
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
                style: TextStyle(
                  color: isLoss ? Colors.red : Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

