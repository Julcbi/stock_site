import '../models/stock.dart';

final List<Stock> indexCards = [
  Stock(symbol: 'S&P 500', company: '', price: 4567.89, changeValue: 23.45, changePercent: 0.52, isUp: true, volume: '', isIndex: true),
  Stock(symbol: 'NASDAQ', company: '', price: 14234.56, changeValue: -45.67, changePercent: -0.32, isUp: false, volume: '', isIndex: true),
  Stock(symbol: 'DOW JONES', company: '', price: 34567.12, changeValue: 123.45, changePercent: 0.36, isUp: true, volume: '', isIndex: true),
  Stock(symbol: 'Market Cap', company: '', price: 45.2, changeValue: 1.21, changePercent: 2.7, isUp: true, volume: '', isIndex: true),
];

final List<Stock> topGainers = [
  Stock(symbol: 'AAPL', company: 'Apple Inc.', price: 175.43, changeValue: 2.34, changePercent: 1.35, isUp: true, volume: '45.2M', isIndex: false),
  Stock(symbol: 'MSFT', company: 'Microsoft Corp.', price: 378.85, changeValue: 4.12, changePercent: 1.10, isUp: true, volume: '23.5M', isIndex: false),
  Stock(symbol: 'AMZN', company: 'Amazon.com Inc.', price: 3342.88, changeValue: 12.45, changePercent: 0.37, isUp: true, volume: '12.3M', isIndex: false),
];

final List<Stock> topLosers = [
  Stock(symbol: 'GOOGL', company: 'Alphabet Inc.', price: 2847.23, changeValue: -15.67, changePercent: -0.55, isUp: false, volume: '1.2M', isIndex: false),
  Stock(symbol: 'TSLA', company: 'Tesla Inc.', price: 248.50, changeValue: -8.23, changePercent: -3.20, isUp: false, volume: '34.6M', isIndex: false),
];

final List<Stock> marketStocks = [
  ...topGainers,
  ...topLosers,
  Stock(symbol: 'NVDA', company: 'NVIDIA Corp.', price: 875.28, changeValue: 23.45, changePercent: 2.75, isUp: true, volume: '56.8M', isIndex: false),
];
