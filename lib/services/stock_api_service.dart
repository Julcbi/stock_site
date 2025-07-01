import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/stock.dart';
import '../models/historical_price.dart';
import '../models/stock_detail.dart';
import '../models/company_profile.dart';


class StockApiService {
  static const String _baseUrl = 'https://financialmodelingprep.com/api/v3';
  static const String _apiKey = 'lmhwddJ0mkX3mV5w1kgOg9bYilS7zTpH'; // chave pública de testes

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
          isUp: double.tryParse(item['change'].toString() ?? '0') != null
              ? double.parse(item['change'].toString()) >= 0
              : false,
          volume: item['volume']?.toString() ?? '',
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
          changePercent: double.tryParse(
              item['changesPercentage'].toString()) ?? 0,
          isUp: changeDouble >= 0,
          volume: item['volume']?.toString() ?? '',
          isIndex: true,
        );
      }).toList();
    } else {
      throw Exception('Erro ao buscar índices');
    }
  }

  static Future<List<HistoricalPrice>> fetchHistoricalPrices(
      String symbol, {
        String range = '1M',
      }) async {
    Uri url;

    if (range == '1D') {
      // Usar dados intraday (5 minutos) para 1D
      url = Uri.parse('$_baseUrl/historical-chart/5min/$symbol?apikey=$_apiKey');
    } else {
      int limit;
      switch (range) {
        case '1W':
          limit = 7;
          break;
        case '1M':
          limit = 30;
          break;
        case '3M':
          limit = 90;
          break;
        case '1Y':
          limit = 365;
          break;
        default:
          limit = 30;
      }

      url = Uri.parse('$_baseUrl/historical-price-full/$symbol?timeseries=$limit&apikey=$_apiKey');
    }

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      // Para '1D' a estrutura é diferente (lista direta)
      final List<dynamic> prices = range == '1D' ? data : data['historical'];

      return prices.map((e) => HistoricalPrice.fromJson(e)).toList().reversed.toList();
    } else {
      throw Exception('Erro ao buscar histórico de preços');
    }
  }




  static Future<List<Stock>> fetchTopGainers() async {
    final url = Uri.parse('$_baseUrl/gainers?apikey=$_apiKey');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      return data.map((item) {
        return Stock(
          symbol: item['ticker'] ?? item['symbol'] ?? '',
          company: item['companyName'] ?? item['name'] ?? '',
          price: double.tryParse(item['price'].toString()) ?? 0,
          changeValue: double.tryParse(item['changes'].toString()) ?? 0,
          changePercent: double.tryParse(item['changesPercentage'].toString()
              .replaceAll('%', '')
              .replaceAll('+', '')
              .replaceAll('-', '')) ??
              0,
          isUp: item['changes'].toString().contains('-') == false,
          volume: item['volume']?.toString() ?? '',
          isIndex: false,
        );
      }).toList();
    } else {
      throw Exception('Erro ao buscar top gainers');
    }
  }


  static Future<List<Stock>> fetchTopLosers() async {
    final url = Uri.parse('$_baseUrl/losers?apikey=$_apiKey');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      return data.map((item) {
        return Stock(
          symbol: item['ticker'] ?? item['symbol'] ?? '',
          company: item['companyName'] ?? item['name'] ?? '',
          price: double.tryParse(item['price'].toString()) ?? 0,
          changeValue: double.tryParse(item['changes'].toString()) ?? 0,
          changePercent: double.tryParse(item['changesPercentage'].toString()
              .replaceAll('%', '')
              .replaceAll('+', '')
              .replaceAll('-', '')) ??
              0,
          isUp: item['changes'].toString().contains('-') == false,
          volume: item['volume']?.toString() ?? '',
          isIndex: false,
        );
      }).toList();
    } else {
      throw Exception('Erro ao buscar top losers');
    }
  }


  static Future<StockDetail> fetchStockDetail(String symbol, {String range = '1M'}) async {
    final url = Uri.parse('$_baseUrl/quote/$symbol?apikey=$_apiKey');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);

      if (data.isEmpty) {
        throw Exception('Nenhum dado encontrado para $symbol');
      }

      final item = data[0];

      // Buscar histórico para gráfico
      final history = await fetchHistoricalPrices(symbol, range: range);

      return StockDetail(
        symbol: item['symbol'] ?? '',
        company: item['name'] ?? '',
        price: double.tryParse(item['price'].toString()) ?? 0,
        changeValue: double.tryParse(item['change'].toString()) ?? 0,
        changePercent: double.tryParse(item['changesPercentage'].toString()) ??
            0,
        isUp: (item['change'] ?? 0) >= 0,
        description: '',
        chartData: history,
      );
    } else {
      throw Exception('Erro ao buscar detalhes da ação');
    }
  }
  static Future<List<Stock>> searchStocks(String query) async {
    final searchUrl = Uri.parse('$_baseUrl/search?query=$query&limit=10&apikey=$_apiKey');
    final searchResponse = await http.get(searchUrl);

    if (searchResponse.statusCode != 200) {
      throw Exception('Erro ao buscar ações');
    }

    final List searchResults = jsonDecode(searchResponse.body);

    if (searchResults.isEmpty) return [];

    final symbols = searchResults.map((e) => e['symbol']).toList();
    if (symbols.isEmpty) return [];

    final joinedSymbols = symbols.join(',');
    final quoteUrl = Uri.parse('$_baseUrl/quote/$joinedSymbols?apikey=$_apiKey');
    final quoteResponse = await http.get(quoteUrl);

    List quoteResults = [];
    if (quoteResponse.statusCode == 200) {
      try {
        final data = jsonDecode(quoteResponse.body);
        if (data is List) {
          quoteResults = data;
        }
      } catch (e) {
        print('Erro ao decodificar quoteResponse: $e');
      }
    }

    return searchResults.map((item) {
      final symbol = item['symbol'] ?? '';
      final name = item['name'] ?? '';

      final quote = quoteResults.firstWhere(
            (q) => q['symbol'] == symbol,
        orElse: () => null,
      );

      final price = double.tryParse(quote?['price']?.toString() ?? '0') ?? 0;
      final change = double.tryParse(quote?['change']?.toString() ?? '0') ?? 0;
      final changePercent = double.tryParse(
        (quote?['changesPercentage']?.toString() ?? '0').replaceAll('%', ''),
      ) ?? 0;

      return Stock(
        symbol: symbol,
        company: name,
        price: price,
        changeValue: change,
        changePercent: changePercent,
        isUp: change >= 0,
        volume: quote?['volume']?.toString() ?? '',
        isIndex: false,
      );
    }).toList();
  }

  static const String _finnhubBaseUrl = 'https://finnhub.io/api/v1';
  static const String _finnhubApiKey = 'd1glqcpr01qn4ub817n0d1glqcpr01qn4ub817ng';

  static Future<CompanyProfile> fetchCompanyProfile(String symbol) async {
    final url = Uri.parse('$_finnhubBaseUrl/stock/profile2?symbol=$symbol&token=$_finnhubApiKey');
    print('🔍 Fetching Finnhub company profile: $url'); // DEBUG
    final response = await http.get(url);

    print('📥 Status: ${response.statusCode}');
    print('📄 Body: ${response.body}');

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return CompanyProfile.fromJson(data);
    } else {
      throw Exception('Failed to load Finnhub company profile');
    }
  }










}
