class Holding {
  final String symbol;
  final String company;
  final int shares;
  final double avgPrice;
  final double currentPrice;

  Holding({
    required this.symbol,
    required this.company,
    required this.shares,
    required this.avgPrice,
    required this.currentPrice,
  });

  double get totalValue => shares * currentPrice;

  double get gainLoss => totalValue - (shares * avgPrice);

  double get gainLossPercent => (gainLoss / (shares * avgPrice)) * 100;
}
