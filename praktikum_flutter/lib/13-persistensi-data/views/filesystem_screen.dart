import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FilesystemScreen extends StatefulWidget {
  const FilesystemScreen({super.key});

  @override
  State<FilesystemScreen> createState() => _FilesystemScreenState();
}

class _FilesystemScreenState extends State<FilesystemScreen> {
  String documentsPath = '';
  String tempPath = '';
  late File myFile;
  String fileText = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getPathsAndWrite();
  }

  Future<void> getPathsAndWrite() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final tempDir = await getTemporaryDirectory();
      
      setState(() {
        documentsPath = directory.path;
        tempPath = tempDir.path;
        myFile = File('$documentsPath/myFile.txt');
      });

      // Write the requested personalized student text
      await writeFile();

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      debugPrint('Error getting paths or writing file: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<bool> writeFile() async {
    try {
      // Customized text format: Name - NIM
      await myFile.writeAsString('Rizky Fadhillah - 411253001');
      return true;
    } catch (e) {
      debugPrint('Error writing file: $e');
      return false;
    }
  }

  Future<void> readFile() async {
    try {
      if (await myFile.exists()) {
        String content = await myFile.readAsString();
        setState(() {
          fileText = content;
        });
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('File read successfully!'),
              duration: Duration(seconds: 1),
            ),
          );
        }
      } else {
        setState(() {
          fileText = 'File does not exist yet. Please write first.';
        });
      }
    } catch (e) {
      debugPrint('Error reading file: $e');
      setState(() {
        fileText = 'Error reading file: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('File System - 411253001'),
        centerTitle: true,
        backgroundColor: theme.colorScheme.primaryContainer,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Temporary Path Card
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.folder_open, color: theme.colorScheme.secondary),
                              const SizedBox(width: 8),
                              Text(
                                'Temporary Directory',
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: theme.colorScheme.secondary,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          SelectableText(
                            tempPath.isEmpty ? 'Loading...' : tempPath,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontFamily: 'monospace',
                              color: Colors.grey[800],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Documents Path Card
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.folder_special, color: theme.colorScheme.primary),
                              const SizedBox(width: 8),
                              Text(
                                'Documents Directory',
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: theme.colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          SelectableText(
                            documentsPath.isEmpty ? 'Loading...' : documentsPath,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontFamily: 'monospace',
                              color: Colors.grey[800],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  
                  // File Operations Panel
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(24.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [
                            theme.colorScheme.surface,
                            theme.colorScheme.primary.withOpacity(0.03),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.description_outlined,
                            size: 64,
                            color: theme.colorScheme.primary.withOpacity(0.7),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Local File Reader / Writer',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'File: myFile.txt',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 24),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            icon: const Icon(Icons.chrome_reader_mode),
                            label: const Text(
                              'Read File',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            onPressed: readFile,
                          ),
                          const SizedBox(height: 24),
                          const Divider(),
                          const SizedBox(height: 16),
                          Text(
                            'File Content:',
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.surfaceVariant.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: theme.colorScheme.outlineVariant,
                              ),
                            ),
                            child: Text(
                              fileText.isEmpty ? '(No content loaded yet)' : fileText,
                              textAlign: TextAlign.center,
                              style: theme.textTheme.titleMedium?.copyWith(
                                color: fileText.isEmpty ? Colors.grey : theme.colorScheme.primary,
                                fontWeight: fileText.isEmpty ? FontWeight.normal : FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
