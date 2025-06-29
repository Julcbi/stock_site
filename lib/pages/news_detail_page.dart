import 'package:flutter/material.dart';
import '../models/news.dart';

class NewsDetailPage extends StatelessWidget {
  final News news;

  const NewsDetailPage({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News Details"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView(
          children: [
            Text(
              news.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: news.imageUrl.isNotEmpty
                  ? Image.network(
                news.imageUrl,
                height: 180, // 👈 Reduz altura da imagem aqui
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 180,
                  color: Colors.grey[300],
                  child: const Center(child: Icon(Icons.broken_image, size: 50, color: Colors.grey)),
                ),
              )
                  : Container(
                height: 180,
                width: double.infinity,
                color: Colors.grey[300],
                child: const Center(child: Icon(Icons.image, size: 50, color: Colors.grey)),
              ),
            ),

            const SizedBox(height: 24),
            Text(
              news.fullContent,
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Source: ${news.source}",
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // futuramente: abrir link original
                  },
                  icon: const Icon(Icons.open_in_new),
                  label: const Text("Share Article"),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black87,
                    backgroundColor: Colors.grey[100],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
