import 'package:flutter/material.dart';
import 'views/stream_home_page.dart';
import 'views/streambuilder_screen.dart';
import 'views/random_screen.dart';

void main() {
  runApp(const MasterStreamApp());
}

class MasterStreamApp extends StatelessWidget {
  const MasterStreamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Streams & BLoC',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFE91E63),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFE91E63),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const StreamDashboard(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class StreamDashboard extends StatelessWidget {
  const StreamDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Streams & BLoC - 411253001'),
        elevation: 2,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          _buildDashboardCard(
            context,
            title: 'Praktikum 1-5: Streams & Subscriptions',
            description: 'Demonstrasi generator async*, delay 1 detik periodik warna, StreamController & Sink, error handling, StreamTransformer manipulasi data, stop subscription, dan broadcast stream.',
            icon: Icons.waves,
            gradientColors: [const Color(0xFFE91E63), const Color(0xFFFF4081)],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const StreamHomePage()),
              );
            },
          ),
          const SizedBox(height: 16),
          _buildDashboardCard(
            context,
            title: 'Praktikum 6: StreamBuilder Screen',
            description: 'Menggunakan widget StreamBuilder secara reaktif untuk membangun UI secara dinamis saat data stream berubah tanpa memanggil setState.',
            icon: Icons.bar_chart,
            gradientColors: [const Color(0xFF9C27B0), const Color(0xFFE040FB)],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const StreamBuilderScreen()),
              );
            },
          ),
          const SizedBox(height: 16),
          _buildDashboardCard(
            context,
            title: 'Praktikum 7: BLoC Random Screen',
            description: 'Penerapan arsitektur BLoC sederhana: memisahkan logika bisnis (RandomNumberBloc) dari UI (StreamBuilder) menggunakan Sink untuk trigger event klik dan Stream untuk output.',
            icon: Icons.refresh,
            gradientColors: [const Color(0xFF2196F3), const Color(0xFF00B0FF)],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RandomScreen()),
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
