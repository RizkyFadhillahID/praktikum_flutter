import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'experience_page.dart';
import 'portfolio_page.dart';
import 'skills_page.dart';

class CVHome extends StatefulWidget {
  const CVHome({super.key});

  @override
  State<CVHome> createState() => _CVHomeState();
}

class _CVHomeState extends State<CVHome> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    ProfilePage(),
    ExperiencePage(),
    PortfolioPage(),
    SkillsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Color(0xFF1E3A5F), width: 1)),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded),
              activeIcon: Icon(Icons.person_rounded),
              label: 'Profil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.work_outline_rounded),
              activeIcon: Icon(Icons.work_rounded),
              label: 'Pengalaman',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.folder_open_outlined),
              activeIcon: Icon(Icons.folder_rounded),
              label: 'Portofolio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.auto_awesome_outlined),
              activeIcon: Icon(Icons.auto_awesome_rounded),
              label: 'Keahlian',
            ),
          ],
        ),
      ),
    );
  }
}
