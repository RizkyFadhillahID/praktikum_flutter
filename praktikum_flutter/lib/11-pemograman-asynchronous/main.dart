import 'package:flutter/material.dart';
import 'views/future_page.dart';
import 'views/location_screen.dart';
import 'views/navigation_first.dart';
import 'views/navigation_dialog.dart';

void main() {
  runApp(const MasterAsyncApp());
}

class MasterAsyncApp extends StatelessWidget {
  const MasterAsyncApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pemrograman Asynchronous',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF673AB7),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF673AB7),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const AsyncDashboard(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AsyncDashboard extends StatelessWidget {
  const AsyncDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Asynchronous - 411253001'),
        elevation: 2,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          _buildDashboardCard(
            context,
            title: 'Praktikum 1-5: Asynchronous & Futures',
            description: 'Eksplorasi Future, API Google Books HTTP request, delay berurutan, Completer, eksekusi paralel (FutureGroup/Future.wait), dan penanganan error.',
            icon: Icons.code_off,
            gradientColors: [const Color(0xFFE040FB), const Color(0xFF673AB7)],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FuturePage()),
              );
            },
          ),
          const SizedBox(height: 16),
          _buildDashboardCard(
            context,
            title: 'Praktikum 6-7: Geolocation & FutureBuilder',
            description: 'Meminta izin GPS perangkat secara langsung untuk mengambil koordinat lokasi terkini dengan loading state di FutureBuilder.',
            icon: Icons.my_location,
            gradientColors: [const Color(0xFF00E676), const Color(0xFF00B0FF)],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LocationScreen()),
              );
            },
          ),
          const SizedBox(height: 16),
          _buildDashboardCard(
            context,
            title: 'Praktikum 8: Navigasi Warna Route',
            description: 'Berpindah rute halaman baru secara asynchronous dan menunggu warna pengembalian dari halaman tujuan.',
            icon: Icons.palette_outlined,
            gradientColors: [const Color(0xFFFF9100), const Color(0xFFFF3D00)],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NavigationFirst()),
              );
            },
          ),
          const SizedBox(height: 16),
          _buildDashboardCard(
            context,
            title: 'Praktikum 9: Navigasi Dialog Warna',
            description: 'Menampilkan AlertDialog interaktif pilihan warna secara asynchronous dan mengubah warna latar belakang setelah dialog ditutup.',
            icon: Icons.chat_bubble_outline,
            gradientColors: [const Color(0xFF00F5FF), const Color(0xFF0082FF)],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NavigationDialogScreen()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardCard(
    BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
    required List<Color> gradientColors,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: theme.cardColor,
          border: Border.all(
            color: theme.dividerColor.withOpacity(0.08),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: gradientColors,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Icon(icon, color: Colors.white, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.hintColor,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: theme.hintColor.withOpacity(0.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
