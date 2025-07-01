import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../models/stock_detail.dart';
import '../services/stock_api_service.dart';
import '../models/news.dart';
import '../services/news_api_service.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/company_profile.dart';




class StockDetailPage extends StatefulWidget {
  final String symbol;

  const StockDetailPage({super.key, required this.symbol});

  @override
  State<StockDetailPage> createState() => _StockDetailPageState();
}

class _StockDetailPageState extends State<StockDetailPage> {
  String _selectedRange = '1M';
  String _selectedCurrency = 'USD';
  late Future<CompanyProfile> _profileFuture;


  final Map<String, double> _exchangeRates = {
    'USD': 1.0,
    'EUR': 0.90,
    'BRL': 5.30,
  };

  double _convert(double value) {
    return value * _exchangeRates[_selectedCurrency]!;
  }

  String _currencySymbol() {
    switch (_selectedCurrency) {
      case 'EUR':
        return '€';
      case 'BRL':
        return 'R\$';
      default:
        return '\$';
    }
  }

  late Future<StockDetail> _stockDetailFuture;
  late Future<List<News>> _newsFuture;


  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    _stockDetailFuture = StockApiService.fetchStockDetail(
      widget.symbol,
      range: _selectedRange,
    );
    _newsFuture = NewsApiService.fetchStockNews(widget.symbol); // usando mesma API
    _profileFuture = StockApiService.fetchCompanyProfile(widget.symbol);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.symbol)),
      body: FutureBuilder<StockDetail>(
        future: _stockDetailFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text("Erro ao carregar dados"));
          } else if (!snapshot.hasData) {
            return const Center(child: Text("Sem dados disponíveis"));
          }

          final stock = snapshot.data!;
          final spots = stock.chartData
              .asMap()
              .entries
              .map((e) => FlSpot(e.key.toDouble(), e.value.close))
              .toList();

// 👇 Adicione aqui (depois de criar `stock` e `spots`)
          final Color chartColor = stock.isUp ? Colors.green : Colors.red;


          return Padding(
            padding: const EdgeInsets.all(16),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        '${stock.company} (${stock.symbol})',
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    DropdownButton<String>(
                      value: _selectedCurrency,
                      items: _exchangeRates.keys.map((currency) {
                        return DropdownMenuItem(
                          value: currency,
                          child: Text(currency),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            _selectedCurrency = value;
                          });
                        }
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 8),
                Text('${_currencySymbol()}${_convert(stock.price).toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                Text(
                  '${stock.isUp ? '+' : '-'}${_currencySymbol()}${_convert(stock.changeValue).toStringAsFixed(2)} (${stock.changePercent.toStringAsFixed(2)}%)',
                  style: TextStyle(
                    color: stock.isUp ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: ['1D', '1W', '1M', '3M', '1Y'].map((range) {
                    final selected = range == _selectedRange;
                    return TextButton(
                      onPressed: () {
                        setState(() {
                          _selectedRange = range;
                          _loadData();
                        });
                      },
                      child: Text(
                        range,
                        style: TextStyle(
                          fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                          color: selected ? Colors.deepPurple : Colors.black,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 300,
                  child: LineChart(LineChartData(
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(show: false),
                    borderData: FlBorderData(show: false),
                    lineBarsData: [
                      LineChartBarData(
                        spots: spots,
                        isCurved: true,
                        color: chartColor,
                        barWidth: 2,
                        dotData: FlDotData(show: false),
                        belowBarData: BarAreaData(
                          show: true,
                          color: chartColor.withOpacity(0.2),
                        ),
                      ),
                    ],


                  )),
                ),

                const SizedBox(height: 32),
                const Text('Company Profile', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),

                FutureBuilder<CompanyProfile>(
                  future: _profileFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Text('Failed to load company profile');
                    } else if (!snapshot.hasData) {
                      return const Text('No profile available.');
                    }

                    final profile = snapshot.data!;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (profile.logo.isNotEmpty)
                          Center(
                            child: Image.network(
                              profile.logo,
                              height: 60,
                            ),
                          ),
                        const SizedBox(height: 12),
                        Text('Company: ${profile.name}'),
                        Text('Ticker: ${profile.ticker}'),
                        Text('Exchange: ${profile.exchange}'),
                        Text('Industry: ${profile.industry}'),
                        Text('Country: ${profile.country}'),
                        Text('IPO Date: ${profile.ipo}'),
                        Text('Market Cap: ${_currencySymbol()}${_convert(profile.marketCapitalization).toStringAsFixed(2)} B'),
                        Text('Outstanding Shares: ${profile.shareOutstanding.toStringAsFixed(2)}'),
                        Text('Phone: ${profile.phone}'),
                        GestureDetector(
                          onTap: () => launchUrl(Uri.parse(profile.webUrl)),
                          child: Text(
                            profile.webUrl,
                            style: const TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    );

                  },
                ),




                const SizedBox(height: 32),
                const Text('Related News', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),

                FutureBuilder<List<News>>(
                  future: _newsFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Text('Erro ao carregar notícias');
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Text('Nenhuma notícia encontrada.');
                    }

                    final newsList = snapshot.data!;
                    return Column(
                      children: newsList.take(5).map((news) {
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            title: Text(news.title),
                            subtitle: Text(news.source),
                            onTap: () => launchUrl(Uri.parse(news.link)),
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),


              ],
            ),
          );
        },
      ),
    );
  }
}
