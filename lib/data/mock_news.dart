import '../models/news.dart';

final List<News> mockNewsList = [
  News(
    title: 'Apple Reports Record Q4 Earnings, Beats Wall Street Expectations',
    description: 'Apple Inc. reported quarterly earnings that exceeded analyst expectations...',
    fullContent: '''Apple Inc. (AAPL) reported its fiscal fourth-quarter earnings on Thursday, surpassing Wall Street expectations and setting new records for the company. The tech giant posted revenue of \$89.5 billion, up 8% year-over-year...

(Read more content or retrieve from API later)''',
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
    fullContent: '''The Federal Reserve is likely to reduce interest rates in 2024, according to recent statements from Chair Jerome Powell...

(More details...)''',
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
    fullContent: '''Google announced the launch of its new AI model tailored for financial applications. The tool aims to analyze market trends...

(Future content from API)''',
    category: 'Technology',
    source: 'TechCrunch',
    tags: ['GOOGL'],
    imageUrl: '',
    publishedAt: DateTime(2025, 6, 25),
    link: 'https://example.com/google-ai-finance',
  ),
  News(
    title: 'AI Stocks Surge as Microsoft Unveils New AI Platform',
    description: 'Artificial intelligence stocks rallied following Microsoft\'s announcement of its latest AI platform and enterprise solutions.',
    fullContent: '''Microsoft unveiled a comprehensive AI platform targeting enterprise customers. The announcement sparked a rally in AI-related stocks...

(More...)''',
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
    fullContent: '''Tensions in the Middle East caused crude oil prices to rise this week, as investors anticipated possible disruptions...

(Future content or link to full article)''',
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
    fullContent: '''The crypto market experienced a notable rally this week, fueled by speculation around the approval of Bitcoin ETFs in the US...

(More from API...)''',
    category: 'Crypto',
    source: 'CoinDesk',
    tags: ['COIN', 'MSTR'],
    imageUrl: '',
    publishedAt: DateTime.now().subtract(Duration(days: 529)),
    link: 'https://example.com/crypto-etf-hopes',
  ),
];
