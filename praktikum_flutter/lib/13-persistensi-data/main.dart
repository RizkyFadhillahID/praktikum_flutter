import 'package:flutter/material.dart';
import 'views/json_screen.dart';
import 'views/sp_screen.dart';
import 'views/filesystem_screen.dart';
import 'views/secure_storage_screen.dart';

class PersistDashboard extends StatelessWidget {
  const PersistDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    final List<Map<String, dynamic>> menuItems = [
      {
        'title': 'JSON Parsing',
        'description': 'Parse & serialize pizza lists defensibly handling malformed or null values.',
        'icon': Icons.code,
        'screen': const JsonScreen(),
        'gradientColors': [const Color(0xFF2196F3), const Color(0xFF64B5F6)],
      },
      {
        'title': 'SharedPreferences',
        'description': 'Save, read & reset app open count locally using key-value storage.',
        'icon': Icons.touch_app,
        'screen': const SpScreen(),
        'gradientColors': [const Color(0xFFFF9800), const Color(0xFFFFB74D)],
      },
      {
        'title': 'File System',
        'description': 'Manage application directories, write to file, and read student identity dynamically.',
        'icon': Icons.folder_special,
        'screen': const FilesystemScreen(),
        'gradientColors': [const Color(0xFF4CAF50), const Color(0xFF81C784)],
      },
      {
        'title': 'Secure Storage',
        'description': 'Encrypt and decrypt sensitive data and passwords locally using secure hardware.',
        'icon': Icons.security,
        'screen': const SecureStorageScreen(),
        'gradientColors': [const Color(0xFFF44336), const Color(0xFFE57373)],
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Persistensi Data - 411253001'),
        centerTitle: true,
        backgroundColor: theme.colorScheme.primaryContainer,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDark
                ? [const Color(0xFF121212), const Color(0xFF1E1E24)]
                : [theme.colorScheme.background, theme.colorScheme.surfaceVariant.withOpacity(0.3)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(20.0),
          itemCount: menuItems.length,
          itemBuilder: (context, index) {
            final item = menuItems[index];
            final gradientColors = item['gradientColors'] as List<Color>;
            
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => item['screen'] as Widget),
                    );
                  },
                  borderRadius: BorderRadius.circular(16),
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
                          child: Icon(
                            item['icon'] as IconData,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['title'] as String,
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                item['description'] as String,
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
              ),
            );
          },
        ),
      ),
    );
  }
}
