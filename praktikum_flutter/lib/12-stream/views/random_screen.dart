import 'package:flutter/material.dart';
import '../bloc/random_bloc.dart';

class RandomScreen extends StatefulWidget {
  const RandomScreen({super.key});

  @override
  State<RandomScreen> createState() => _RandomScreenState();
}

class _RandomScreenState extends State<RandomScreen> {
  final _bloc = RandomNumberBloc();

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Number - 411253001'),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: _bloc.randomNumber,
          initialData: 0,
          builder: (context, snapshot) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.casino, size: 80, color: Colors.blue),
                const SizedBox(height: 16),
                const Text(
                  'Angka Acak BLoC:',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Text(
                  '${snapshot.data}',
                  style: const TextStyle(
                    fontSize: 72,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _bloc.generateRandom.add(null),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
