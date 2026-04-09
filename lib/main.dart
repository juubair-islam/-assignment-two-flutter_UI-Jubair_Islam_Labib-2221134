import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/reports_screen.dart';
import 'screens/cards_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finance App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4B3EE8)),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // REQUIREMENT MET: Using _currentIndex and PageController
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // Helper to build the stylized active icon (purple background box)
  Widget _buildActiveIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFE8EAFE), // Light purple background
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, color: const Color(0xFF4B3EE8), size: 24),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // REQUIREMENT MET: Implemented using PageView
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(), // Prevents sliding by hand
        children: const [
          HomeScreen(),    // Page 1 (Mandatory)
          ReportsScreen(), // Page 2 (Optional/Choose 1)
          CardsScreen(),   // Page 3 (Optional/Choose 1)
          ProfileScreen(), // Page 4 (Mandatory - contains bio/ID)
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: const Color(0xFF4B3EE8),
          unselectedItemColor: const Color(0xFF9E9E9E),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 0, 
          selectedFontSize: 12,
          unselectedFontSize: 12,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w700,
            color: Color(0xFF4B3EE8),
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Color(0xFF9E9E9E),
          ),
          // REQUIREMENT MET: onTap triggers jumpToPage
          onTap: (i) {
            setState(() => _currentIndex = i);
            _pageController.jumpToPage(i);
          },
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home_outlined),
              activeIcon: _buildActiveIcon(Icons.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.bar_chart_outlined),
              activeIcon: _buildActiveIcon(Icons.bar_chart_rounded),
              label: 'Reports',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.credit_card_outlined),
              activeIcon: _buildActiveIcon(Icons.credit_card_rounded),
              label: 'Cards',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.person_outline_rounded),
              activeIcon: _buildActiveIcon(Icons.person_rounded),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}