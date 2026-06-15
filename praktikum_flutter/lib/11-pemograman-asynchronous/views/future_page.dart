import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  String result = '';
  late Completer<int> completer;

  // --- Praktikum 1 ---
  Future<http.Response> getData() async {
    final url = Uri.https('www.googleapis.com', '/books/v1/volumes/zyTCAlFPjgYC');
    return http.get(url);
  }

  // --- Praktikum 2 ---
  Future<int> returnOneAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 1;
  }

  Future<int> returnTwoAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 2;
  }

  Future<int> returnThreeAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 3;
  }

  Future<void> count() async {
    setState(() {
      result = 'Calculating... (Wait 9s)';
    });
    int total = 0;
    total += await returnOneAsync();
    total += await returnTwoAsync();
    total += await returnThreeAsync();
    setState(() {
      result = total.toString();
    });
  }

  // --- Praktikum 3 ---
  Future<int> getNumber() {
    completer = Completer<int>();
    calculate();
    return completer.future;
  }

  Future<void> calculate() async {
    try {
      await Future.delayed(const Duration(seconds: 5));
      completer.complete(42);
    } catch (_) {
      completer.completeError({});
    }
  }

  // --- Praktikum 4 ---
  void returnFG() {
    setState(() {
      result = 'Calculating Parallel... (Wait 3s)';
    });
    FutureGroup<int> futureGroup = FutureGroup<int>();
    futureGroup.add(returnOneAsync());
    futureGroup.add(returnTwoAsync());
    futureGroup.add(returnThreeAsync());
    futureGroup.close();
    futureGroup.future.then((List<int> value) {
      int total = 0;
      for (var element in value) {
        total += element;
      }
      setState(() {
        result = '$total (via FutureGroup)';
      });
    });
  }

  Future<void> runParallelWait() async {
    setState(() {
      result = 'Calculating Parallel... (Wait 3s)';
    });
    final futures = await Future.wait<int>([
      returnOneAsync(),
      returnTwoAsync(),
      returnThreeAsync(),
    ]);
    int total = futures.reduce((a, b) => a + b);
    setState(() {
      result = '$total (via Future.wait)';
    });
  }

  // --- Praktikum 5 ---
  Future<void> returnError() async {
    await Future.delayed(const Duration(seconds: 2));
    throw Exception('Something terrible happened!');
  }

  Future<void> handleError() async {
    setState(() {
      result = 'Running... (Wait 2s)';
    });
    try {
      await returnError();
    } catch (error) {
      setState(() {
        result = error.toString();
      });
    } finally {
      // ignore: avoid_print
      print('Complete');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Asynchronous Futures - 411253001'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(),
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                constraints: const BoxConstraints(minHeight: 100),
                child: Center(
                  child: Text(
                    result.isEmpty ? 'Tekan salah satu tombol untuk mulai' : result,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                icon: const Icon(Icons.download),
                label: const Text('Praktikum 1: Ambil Data API'),
                onPressed: () {
                  setState(() {
                    result = 'Loading data...';
                  });
                  getData().then((value) {
                    setState(() {
                      result = value.body.toString().substring(0, 450);
                    });
                  }).catchError((_) {
                    setState(() {
                      result = 'Terjadi kesalahan saat mengambil data';
                    });
                  });
                },
              ),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                icon: const Icon(Icons.hourglass_bottom),
                label: const Text('Praktikum 2: Hitung Berurutan (9 Detik)'),
                onPressed: count,
              ),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                icon: const Icon(Icons.check_circle_outline),
                label: const Text('Praktikum 3: Completer (5 Detik)'),
                onPressed: () {
                  setState(() {
                    result = 'Waiting for Completer...';
                  });
                  getNumber().then((value) {
                    setState(() {
                      result = 'Hasil Completer: $value';
                    });
                  }).catchError((e) {
                    setState(() {
                      result = 'Completer error occurred';
                    });
                  });
                },
              ),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                icon: const Icon(Icons.flash_on),
                label: const Text('Praktikum 4: Hitung Paralel (FutureGroup)'),
                onPressed: returnFG,
              ),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                icon: const Icon(Icons.bolt),
                label: const Text('Praktikum 4: Hitung Paralel (Future.wait)'),
                onPressed: runParallelWait,
              ),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                icon: const Icon(Icons.error_outline),
                label: const Text('Praktikum 5: Uji Coba Error'),
                onPressed: handleError,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
