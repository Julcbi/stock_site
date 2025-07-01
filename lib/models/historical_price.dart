class HistoricalPrice {
  final DateTime date;
  final double close;

  HistoricalPrice({required this.date, required this.close});

  factory HistoricalPrice.fromJson(Map<String, dynamic> json) {
    return HistoricalPrice(

      date: DateTime.tryParse(json['date']) ?? DateTime.now(),
      close: double.tryParse(json['close'].toString()) ?? 0,
    );
  }
}
