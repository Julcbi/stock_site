import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/news.dart';

class NewsApiService {
  static const _apiKey = 'd1glqcpr01qn4ub817n0d1glqcpr01qn4ub817ng';
  static const _baseUrl = 'https://finnhub.io/api/v1';

  static Future<List<News>> fetchLatestNews() async {
    final url = Uri.parse('https://finnhub.io/api/v1/news?category=general&token=$_apiKey');
    final resp = await http.get(url);
    if (resp.statusCode == 200) {
      final List data = jsonDecode(resp.body);
      return data.map((json) => News.fromFinnhubJson(json)).toList();
    }
    throw Exception('Erro ao buscar notícias: ${resp.statusCode}');
  }

  static Future<List<News>> fetchStockNews(String symbol) async {
    final url = Uri.parse('$_baseUrl/company-news?symbol=$symbol&from=2024-01-01&to=2025-12-31&token=$_apiKey');
    final resp = await http.get(url);

    if (resp.statusCode == 200) {
      final List data = jsonDecode(resp.body);
      return data.map((json) => News.fromFinnhubJson(json)).toList();
    } else {
      throw Exception('Erro ao buscar notícias da ação $symbol');
    }
  }


}
