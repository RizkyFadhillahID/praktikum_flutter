import 'package:flutter/material.dart';
import 'basic_widgets/scaffold_widget.dart';
import 'basic_widgets/dialog_widget.dart';
import 'basic_widgets/input_widget.dart';
import 'basic_widgets/date_picker_widget.dart';
import 'basic_widgets/text_widget.dart';
import 'basic_widgets/image_widget.dart';
import 'basic_widgets/loading_cupertino.dart';
import 'basic_widgets/fab_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Dasar Dashboard',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const WidgetDasarDashboard(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WidgetDasarDashboard extends StatelessWidget {
  const WidgetDasarDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Dasar - 411253001'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Praktikum Week 5',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          _buildMenuButton(
            context,
            'Langkah 1: Text Widget',
            Scaffold(
              appBar: AppBar(title: const Text('Text Widget')),
              body: const Center(child: MyTextWidget()),
            ),
          ),
          _buildMenuButton(
            context,
            'Langkah 2: Image Widget',
            Scaffold(
              appBar: AppBar(title: const Text('Image Widget')),
              body: const Center(child: MyImageWidget()),
            ),
          ),
          _buildMenuButton(
            context,
            'Cupertino Button & Loading',
            Scaffold(
              appBar: AppBar(title: const Text('Cupertino Loading')),
              body: const Center(child: MyCupertinoLoading()),
            ),
          ),
          _buildMenuButton(
            context,
            'Floating Action Button (FAB)',
            Scaffold(
              appBar: AppBar(title: const Text('FAB Widget')),
              body: const Center(child: MyFABWidget()),
            ),
          ),
          _buildMenuButton(
            context,
            'Langkah 3: Scaffold Widget',
            const MyScaffoldWidget(),
          ),
          _buildMenuButton(
            context,
            'Langkah 4: Dialog Widget',
            const MyDialogWidget(),
          ),
          _buildMenuButton(
            context,
            'Langkah 5: Input Widget',
            const MyInputWidget(),
          ),
          _buildMenuButton(
            context,
            'Langkah 6: Date & Time Picker',
            const MyDatePickerWidget(),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context, String title, Widget target) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          backgroundColor: Colors.red.shade50,
          foregroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => target),
          );
        },
        child: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
