import 'package:flutter/material.dart';
import '../widgets/news_card.dart';
import '../models/news.dart';
import '../services/news_api_service.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  String selectedCategory = 'All News';
  String searchQuery = '';
  late Future<List<News>> _futureNews;

  // final List<String> categories = [
  //   'All News',
  //   'Market',
  //   'Earnings',
  //   'Technology',
  //   'Corporate',
  //   'Commodities',
  //   'Crypto',
  // ];

  @override
  void initState() {
    super.initState();
    _futureNews = NewsApiService.fetchLatestNews();
  }

  List<String> palavrasChave = [
    'apple', 'tesla', 'microsoft', 'amazon',
    'google', 'meta', 'stock', 'nasdaq',
    'dow jones', 's&p', 'market', 'equity',
    'aapl', 'tsla', 'msft', 'amzn', 'googl'
  ];

  List<News> filterNews(List<News> allNews) {
    return allNews.where((news) {
      final title = news.title.toLowerCase();
      final description = news.description.toLowerCase();
      final query = searchQuery.toLowerCase();

      final matchesSearch = query.isEmpty || title.contains(query);
      final matchesKeyword = palavrasChave.any((palavra) =>
      title.contains(palavra) || description.contains(palavra)
      );

      return matchesSearch && matchesKeyword;
    }).toList();
  }



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 🌟 Título
          GradientText(
            'Financial News & Analysis',
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            gradient: const LinearGradient(
              colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
            ),
          ),
          const SizedBox(height: 12),

          // Subtítulo
          const Text(
            'Stay informed with the latest market news, earnings reports, and financial insights.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),

          const SizedBox(height: 24),

          // 🔍 Barra de pesquisa
          TextField(
            decoration: InputDecoration(
              hintText: 'Search news...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onChanged: (value) {
              setState(() {
                searchQuery = value;
              });
            },
          ),

          const SizedBox(height: 16),

          // 🧭 Botões de categorias
          // SizedBox(
          //   height: 40,
          //   child: ListView.separated(
          //     scrollDirection: Axis.horizontal,
          //     itemCount: categories.length,
          //     separatorBuilder: (_, __) => const SizedBox(width: 8),
          //     itemBuilder: (context, index) {
          //       final category = categories[index];
          //       final isSelected = selectedCategory == category;
          //
          //       return GestureDetector(
          //         onTap: () {
          //           setState(() {
          //             selectedCategory = category;
          //           });
          //         },
          //         child: Container(
          //           padding:
          //           const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          //           decoration: BoxDecoration(
          //             color: isSelected
          //                 ? Colors.deepPurple[100]
          //                 : Colors.grey[200],
          //             borderRadius: BorderRadius.circular(20),
          //           ),
          //           child: Text(
          //             category,
          //             style: TextStyle(
          //               color: isSelected
          //                   ? Colors.deepPurple[800]
          //                   : Colors.black87,
          //               fontWeight: FontWeight.w500,
          //             ),
          //           ),
          //         ),
          //       );
          //     },
          //   ),
          // ),

          const SizedBox(height: 20),

          // 📰 Lista filtrada de notícias da API
          FutureBuilder<List<News>>(
            future: _futureNews,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Erro ao carregar notícias: ${snapshot.error}');
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Text('Nenhuma notícia encontrada.');
              }

              final filtered = filterNews(snapshot.data!);

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filtered.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  final news = filtered[index];
                  return NewsCard(news: news);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

// Widget de texto com gradiente (já usado no título)
class GradientText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Gradient gradient;

  const GradientText(this.text,
      {super.key, required this.style, required this.gradient});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) =>
          gradient.createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
      child: Text(text, style: style.copyWith(color: Colors.white)),
    );
  }
}
