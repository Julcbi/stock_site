import 'package:flutter/material.dart';
import '../widgets/news_card.dart';
import '../data/mock_news.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GradientText(
            'Financial News & Analysis',
            style: const TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
            gradient: const LinearGradient(
              colors: [
                Color(0xFF6A11CB),
                Color(0xFF2575FC),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Stay informed with the latest market news, earnings reports, and\nfinancial insights.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),

      const SizedBox(height: 24),

// 🔍 Barra de pesquisa
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search news...',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onChanged: (value) {
            // Lógica de busca (mock) futura
          },
        ),
      ),

      const SizedBox(height: 20),

// 🧭 Botões de categorias
      SizedBox(
        height: 40,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            _buildCategoryChip('All News'),
            _buildCategoryChip('Market'),
            _buildCategoryChip('Earnings'),
            _buildCategoryChip('Technology'),
            _buildCategoryChip('Corporate'),
            _buildCategoryChip('Commodities'),
            _buildCategoryChip('Crypto'),
          ],
        ),
      ),
      const SizedBox(height: 20),

// 📰 Lista de notícias mock
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: mockNewsList.length,
          itemBuilder: (context, index) {
            final news = mockNewsList[index];
            return NewsCard(news: news);
          },
        ),
      ),


    ],

      ),

    );
  }

  Widget _buildCategoryChip(String label) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }


}

class GradientText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Gradient gradient;

  const GradientText(this.text, {super.key, required this.style, required this.gradient});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style.copyWith(color: Colors.white)),
    );
  }
}