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
];
