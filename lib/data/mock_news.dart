import '../models/news.dart';

final List<News> mockNewsList = [
  News(
    title: 'Apple Reports Record Q4 Earnings, Beats Wall Street Expectations',
    description: 'Apple Inc. reported quarterly earnings that exceeded analyst expectations...',
    category: 'Earnings',
    source: 'Financial Times',
    tags: ['AAPL'],
    imageUrl: '',
    publishedAt: DateTime(2025, 6, 26),
    link: 'https://example.com/apple-earnings',
  ),
  News(
    title: 'Federal Reserve Signals Potential Rate Cuts in 2024',
    description: 'The Federal Reserve indicated a more dovish stance...',
    category: 'Market',
    source: 'Reuters',
    tags: ['SPY', 'QQQ'],
    imageUrl: '',
    publishedAt: DateTime(2025, 6, 26),
    link: 'https://example.com/fed-rates',
  ),
  News(
    title: 'Google Launches New AI Model for Finance',
    description: 'Google has unveiled a specialized AI model aimed at enhancing financial market predictions.',
    category: 'Technology',
    source: 'TechCrunch',
    tags: ['GOOGL'],
    imageUrl: '',
    publishedAt: DateTime(2025, 6, 25), // 👈 Data simulada, pode ajustar
    link: 'https://example.com/google-ai-finance',
  ),
  News(
    title: 'AI Stocks Surge as Microsoft Unveils New AI Platform',
    description: 'Artificial intelligence stocks rallied following Microsoft\'s announcement of its latest AI platform and enterprise solutions.',
    category: 'Technology',
    source: 'CNBC',
    tags: ['MSFT', 'NVDA', 'GOOGL'],
    imageUrl: '',
    publishedAt: DateTime.now().subtract(Duration(days: 529)),
    link: 'https://example.com/msft-ai-launch',
  ),

  News(
    title: 'Oil Prices Rise on Middle East Tensions',
    description: 'Crude oil futures climbed higher amid escalating geopolitical tensions in the Middle East, raising supply concerns.',
    category: 'Commodities',
    source: 'Wall Street Journal',
    tags: ['XOM', 'CVX'],
    imageUrl: '',
    publishedAt: DateTime.now().subtract(Duration(days: 529)),
    link: 'https://example.com/oil-prices-rise',
  ),

  News(
    title: 'Cryptocurrency Market Rallies on ETF Approval Hopes',
    description: 'Bitcoin and other cryptocurrencies surged as investors anticipate potential approval of spot Bitcoin ETFs by regulators.',
    category: 'Crypto',
    source: 'CoinDesk',
    tags: ['COIN', 'MSTR'],
    imageUrl: '',
    publishedAt: DateTime.now().subtract(Duration(days: 529)),
    link: 'https://example.com/crypto-etf-hopes',
  ),

];
