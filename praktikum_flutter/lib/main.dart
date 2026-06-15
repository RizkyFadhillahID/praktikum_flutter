import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import '5-widget-dasar/main.dart' as w5;
import '6-layout-navigasi/main.dart' as w6;
import '6-layout-navigasi/pages/item_page.dart' as w6_pages;
import '7-manajemen-plugin/main.dart' as w7;
import '9-kamera/widget/takepicture_screen.dart' as w9;
import '10-dasar-state-management/provider/plan_provider.dart' as w10_provider;
import '10-dasar-state-management/views/plan_creator_screen.dart' as w10_views;
import '10-dasar-state-management/models/data_layer.dart' as w10_models;
import '11-pemograman-asynchronous/main.dart' as w11;
import '12-stream/main.dart' as w12;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard Praktikum Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6200EE),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6200EE),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {
        '/': (context) => const RootDashboard(),
        '/item': (context) => const w6_pages.ItemPage(itemName: '', price: 0),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class RootDashboard extends StatelessWidget {
  const RootDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            expandedHeight: 180,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
              title: Text(
                'Praktikum Mobile',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : Colors.black87,
                ),
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: isDark
                        ? [const Color(0xFF1F1B24), const Color(0xFF332940)]
                        : [const Color(0xFFE3F2FD), const Color(0xFFBBDEFB)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile Card
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                          colors: [
                            theme.colorScheme.primary,
                            theme.colorScheme.secondary,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      padding: const EdgeInsets.all(20),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Rizky Fadhillah',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'NIM: 411253001',
                            style: TextStyle(
                              fontSize: 16,
                              color: whiteBF,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Divider(color: Colors.white54, height: 24),
                          Text(
                            'Teknik Informatika - UNDIRA',
                            style: TextStyle(
                              fontSize: 14,
                              color: whiteE6,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  Text(
                    'Daftar Praktikum',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Week 5 Card
                  _buildDashboardCard(
                    context,
                    title: 'Praktikum 5: Widget Dasar',
                    description: 'Menerapkan widget dasar Material Design dan Cupertino (Scaffold, Dialog, Input, Date Time Pickers).',
                    icon: Icons.widgets_outlined,
                    gradientColors: [const Color(0xFFF44336), const Color(0xFFFF7961)],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const w5.WidgetDasarDashboard(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),

                  // Week 6 Card
                  _buildDashboardCard(
                    context,
                    title: 'Praktikum 6: Layout & Navigasi',
                    description: 'Mengembangkan layout antarmuka dinamis dan navigasi rute halaman pada Flutter.',
                    icon: Icons.map_outlined,
                    gradientColors: [const Color(0xFF2196F3), const Color(0xFF6EC6FF)],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const w6.LayoutNavigasiDashboard(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),

                  // Week 7 Card
                  _buildDashboardCard(
                    context,
                    title: 'Praktikum 7: Manajemen Plugin',
                    description: 'Mengintegrasikan auto_size_text dari pub.dev untuk auto-resizing teks secara responsif.',
                    icon: Icons.extension_outlined,
                    gradientColors: [const Color(0xFF4CAF50), const Color(0xFF80E27E)],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const w7.MyHomePage(
                            title: 'Manajemen Plugin - 411253001',
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),

                  // Week 9 Card
                  _buildDashboardCard(
                    context,
                    title: 'Praktikum 9: Kamera & Filter',
                    description: 'Mengakses sensor kamera perangkat, mengambil foto, dan menerapkan carousel filter warna secara langsung.',
                    icon: Icons.camera_alt_outlined,
                    gradientColors: [const Color(0xFFFF9800), const Color(0xFFFFC947)],
                    onTap: () async {
                      try {
                        final cameras = await availableCameras();
                        final firstCamera = cameras.first;
                        if (!context.mounted) return;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => w9.TakePictureScreen(camera: firstCamera),
                          ),
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Error inisialisasi kamera: $e')),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 16),

                  // Week 10 Card
                  _buildDashboardCard(
                    context,
                    title: 'Praktikum 10: State Management',
                    description: 'Mengelola state aplikasi secara reaktif menggunakan InheritedNotifier, ValueNotifier, dan penanganan multi-screen.',
                    icon: Icons.layers_outlined,
                    gradientColors: [const Color(0xFF9C27B0), const Color(0xFFE040FB)],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => w10_provider.PlanProvider(
                            notifier: ValueNotifier<List<w10_models.Plan>>(const []),
                            child: const w10_views.PlanCreatorScreen(),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),

                  // Week 11 Card
                  _buildDashboardCard(
                    context,
                    title: 'Praktikum 11: Pemrograman Asynchronous',
                    description: 'Eksplorasi pemrograman asynchronous di Flutter: Futures, Completer, FutureBuilder, navigasi Route async, dan Widget Dialog.',
                    icon: Icons.sync_alt,
                    gradientColors: [const Color(0xFF673AB7), const Color(0xFF9575CD)],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const w11.AsyncDashboard(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),

                  // Week 12 Card
                  _buildDashboardCard(
                    context,
                    title: 'Praktikum 12: State & Streams & BLoC',
                    description: 'Eksplorasi lanjutan pemrograman asynchronous & state management: Dart Streams, StreamControllers, StreamBuilders, dan pola arsitektur BLoC.',
                    icon: Icons.waves,
                    gradientColors: [const Color(0xFFE91E63), const Color(0xFFFF8A80)],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const w12.StreamDashboard(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          )
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

// Helper colors for custom text
const Color whiteBF = Color(0xBFFFFFFF);
const Color whiteE6 = Color(0xE6FFFFFF);
