class WatchItem {
  final String symbol;
  final String company;
  final double currentPrice;
  final double percentChange;

  WatchItem({
    required this.symbol,
    required this.company,
    required this.currentPrice,
    required this.percentChange,
  });

  bool get isGain => percentChange >= 0;
}
