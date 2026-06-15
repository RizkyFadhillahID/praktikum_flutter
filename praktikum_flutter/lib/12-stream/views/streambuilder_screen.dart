import 'package:flutter/material.dart';

class NumberStream {
  Stream<int> getNumbers() async* {
    yield* Stream.periodic(const Duration(seconds: 1), (int t) {
      return t;
    });
  }
}

class StreamBuilderScreen extends StatefulWidget {
  const StreamBuilderScreen({super.key});

  @override
  State<StreamBuilderScreen> createState() => _StreamBuilderScreenState();
}

class _StreamBuilderScreenState extends State<StreamBuilderScreen> {
  late Stream<int> numberStream;

  @override
  void initState() {
    super.initState();
    numberStream = NumberStream().getNumbers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StreamBuilder - 411253001'),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: numberStream,
          initialData: 0,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text(
                'Terjadi Kesalahan',
                style: TextStyle(color: Colors.red, fontSize: 24),
              );
            }
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Text('Tidak ada koneksi stream');
              case ConnectionState.waiting:
                return const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text('Menunggu stream...'),
                  ],
                );
              case ConnectionState.active:
              case ConnectionState.done:
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.stream, size: 80, color: Colors.purple),
                    const SizedBox(height: 16),
                    const Text(
                      'Aliran Angka secara Real-time:',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${snapshot.data}',
                      style: const TextStyle(
                        fontSize: 96,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                  ],
                );
            }
          },
        ),
      ),
    );
  }
}
