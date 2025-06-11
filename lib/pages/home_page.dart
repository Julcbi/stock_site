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
          color: isActive ? const Color(0xFF6A11CB) : Colors.grey,
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              // 🔝 TOPO COM LOGO, MENU E ÍCONES
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // LOGO à esquerda
                  Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.trending_up, color: Colors.white, size: 20),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Invisto',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),

                  // MENU no centro
                  Row(
                    children: List.generate(
                      _titles.length,
                          (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: _buildMenuButton(_titles[index], index),
                      ),
                    ),
                  ),

                  // ÍCONES à direita
                  Row(
                    children: const [
                      Icon(Icons.wb_sunny_outlined, size: 20),
                      SizedBox(width: 16),
                      Icon(Icons.notifications_none_outlined, size: 20),
                      SizedBox(width: 16),
                      Icon(Icons.person_outline, size: 20),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // CONTEÚDO DA ABA SELECIONADA
              Expanded(
                child: IndexedStack(
                  index: _selectedIndex,
                  children: _pages,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
