import 'historical_price.dart';

class StockDetail {
  final String symbol;
  final String company;
  final double price;
  final double changeValue;
  final double changePercent;
  final bool isUp;
  final String description;
  final List<HistoricalPrice> chartData;

  StockDetail({
    required this.symbol,
    required this.company,
    required this.price,
    required this.changeValue,
    required this.changePercent,
    required this.isUp,
    required this.description,
    required this.chartData,
  });
}
