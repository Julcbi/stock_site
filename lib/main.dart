import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'package:flutter/services.dart';
import 'pages/stock_detail_page.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Invisto',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/stock_detail': (context) {
          final symbol = ModalRoute.of(context)!.settings.arguments as String;
          return StockDetailPage(symbol: symbol);
        },
      },
    );

  }
}

