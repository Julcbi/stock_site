import 'package:flutter/material.dart';
import 'dashboard_page.dart';
import 'news_page.dart';
import 'portfolio_page.dart';
import 'pro_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    DashboardPage(),
    NewsPage(),
    PortfolioPage(),
    ProPage(),
  ];

  final List<String> _titles = [
    'Dashboard',
    'News',
    'Portfolio',
    'Pro',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildMenuButton(String title, int index) {
    final bool isActive = _selectedIndex == index;

    return TextButton(
      onPressed: () => _onItemTapped(index),
      child: Text(
        title,
        style: TextStyle(
          color: isActive ? Color(0xFF6A11CB) : Colors.grey,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          fontSize: 16,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _titles.length,
                    (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: _buildMenuButton(_titles[index], index),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: IndexedStack(
                index: _selectedIndex,
                children: _pages,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
