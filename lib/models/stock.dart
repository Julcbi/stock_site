class Stock {
  final String symbol;
  final String company;
  final double price;
  final double changeValue;
  final double changePercent;
  final bool isUp;
  final String volume;
  final bool isIndex;

  Stock({
    required this.symbol,
    required this.company,
    required this.price,
    required this.changeValue,
    required this.changePercent,
    required this.isUp,
    required this.volume,
    required this.isIndex,
  });

  // 🔧 ESTE É O fromJson QUE FALTAVA
  factory Stock.fromJson(Map<String, dynamic> json) {
    return Stock(
      symbol: json['symbol'] ?? '',
      company: json['name'] ?? '',
      price: double.tryParse(json['price']?.toString() ?? '0') ?? 0,
      changeValue: double.tryParse(json['change']?.toString() ?? '0') ?? 0,
      changePercent: double.tryParse(json['changesPercentage']?.toString() ?? '0') ?? 0,
      isUp: double.tryParse(json['change']?.toString() ?? '0') != null
          ? double.parse(json['change'].toString()) >= 0
          : false,
      volume: json['volume']?.toString() ?? '',
      isIndex: false,
    );
  }






}
