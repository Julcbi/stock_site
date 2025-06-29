import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/stock.dart';

class StockApiService {
  static const String _baseUrl = 'https://financialmodelingprep.com/api/v3';
  static const String _apiKey = '3YLXPLySz4UqftIsrGB89kDoSlXMlwoQ'; // chave pública de testes

  // Busca ações mais ativas (para popular o dashboard)
  static Future<List<Stock>> fetchMarketStocks() async {
    final url = Uri.parse('$_baseUrl/stock_market/actives?apikey=$_apiKey');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      return data.map((item) {
        return Stock(
          symbol: item['symbol'] ?? '',
          company: item['name'] ?? '',
          price: double.tryParse(item['price'].toString()) ?? 0,
          changeValue: double.tryParse(item['change'].toString()) ?? 0,
          changePercent: double.tryParse(item['changesPercentage'].toString()) ?? 0,
          isUp: (item['change'] ?? 0) >= 0,
          volume: '', // não vem nesse endpoint
          isIndex: false,
        );
      }).toList();
    } else {
      throw Exception('Erro ao buscar ações ativas');
    }
  }
  // 1. CRIE ESTES MÉTODOS NA SUA STOCK API SERVICE:

  static Future<List<Stock>> fetchIndexCards() async {
    final url = Uri.parse('$_baseUrl/quotes/index?apikey=$_apiKey');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((item) {
        final changeRaw = item['change'];
        final changeDouble = double.tryParse(changeRaw.toString()) ?? 0;

        return Stock(
          symbol: item['symbol'] ?? '',
          company: item['name'] ?? '',
          price: double.tryParse(item['price'].toString()) ?? 0,
          changeValue: changeDouble,
          changePercent: double.tryParse(item['changesPercentage'].toString()) ?? 0,
          isUp: changeDouble >= 0,
          volume: item['volume']?.toString() ?? '',
          isIndex: true,
        );
      }).toList();
    } else {
      throw Exception('Erro ao buscar índices');
    }
  }



  static Future<List<Stock>> fetchTopGainers() async {
    final url = Uri.parse('$_baseUrl/gainers?apikey=$_apiKey');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((json) => Stock.fromJson(json)).toList();
    } else {
      throw Exception('Erro ao buscar top gainers');
    }
  }

  static Future<List<Stock>> fetchTopLosers() async {
    final url = Uri.parse('$_baseUrl/losers?apikey=$_apiKey');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((json) => Stock.fromJson(json)).toList();
    } else {
      throw Exception('Erro ao buscar top losers');
    }
  }

}
