import 'historical_price.dart'; // ajuste o caminho se necessário

class StockDetail {
  final String symbol;
  final String company;
  final double price;
  final double changeValue;
  final double changePercent;
  final bool isUp;
  final String description;
  final List<HistoricalPrice> chartData; // ⬅️ Agora é uma lista com datas

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
