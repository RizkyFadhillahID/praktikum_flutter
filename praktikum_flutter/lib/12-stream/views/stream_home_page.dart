import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class ColorStream {
  final List<Color> colors = [
    Colors.blue,
    Colors.amber,
    Colors.red,
    Colors.green,
    Colors.purple,
    Colors.teal,
    Colors.indigo,
    Colors.orange,
    Colors.pink,
    Colors.cyan,
  ];

  Stream<Color> getColors() async* {
    yield* Stream.periodic(const Duration(seconds: 1), (int t) {
      int index = t % colors.length;
      return colors[index];
    });
  }
}

class NumberStream {
  final StreamController<int> _controller = StreamController<int>();

  Stream<int> get stream => _controller.stream;

  Sink<int> get sink => _controller.sink;

  void addNumberToSink(int newNumber) {
    _controller.sink.add(newNumber);
  }

  void addError() {
    _controller.sink.addError('Error: Random number is 5!');
  }

  void close() {
    _controller.close();
  }
}

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({super.key});

  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
  Color bgColor = Colors.blue.shade700;
  late ColorStream colorStream;

  // For Number Stream
  int lastNumber = 0;
  late StreamController<int> numberStreamController;
  late NumberStream numberStream;

  // Subscriptions
  late StreamSubscription<int> subscription;
  late StreamSubscription<int> subscription2; // For broadcast testing
  String values = '';
  bool isSubscribed = true;

  @override
  void initState() {
    super.initState();

    // Color Stream (Praktikum 1)
    colorStream = ColorStream();
    colorStream.getColors().listen((Color newColor) {
      setState(() {
        bgColor = newColor;
      });
    });

    // Number Stream (Praktikum 2-5)
    numberStream = NumberStream();
    numberStreamController = numberStream._controller;
    
    // Convert to Broadcast Stream (Praktikum 5)
    final stream = numberStreamController.stream.asBroadcastStream();

    // Transformer (Praktikum 3)
    final transformer = StreamTransformer<int, int>.fromHandlers(
      handleData: (value, sink) {
        sink.add(value * 10);
      },
      handleError: (error, trace, sink) {
        sink.add(-1);
      },
      handleDone: (sink) {
        sink.close();
      },
    );

    // Subscribe 1 (Praktikum 4)
    subscription = stream.transform(transformer).listen(
      (int myNum) {
        setState(() {
          lastNumber = myNum;
          values += '$myNum - ';
        });
      },
      onError: (err) {
        setState(() {
          values += 'Error - ';
        });
      },
      onDone: () {
        // ignore: avoid_print
        print('OnDone was called');
      },
    );

    // Subscribe 2 (Praktikum 5)
    subscription2 = stream.listen((int val) {
      // ignore: avoid_print
      print('Subscription 2 received: $val');
    });
  }

  @override
  void dispose() {
    // ignore: discarded_futures
    numberStreamController.close();
    subscription.cancel();
    subscription2.cancel();
    super.dispose();
  }

  void addRandomNumber() {
    final random = Random();
    int myNum = random.nextInt(10);
    if (myNum == 5) {
      numberStream.addError();
    } else {
      numberStream.addNumberToSink(myNum);
    }
  }

  void stopSubscription() {
    subscription.cancel();
    setState(() {
      isSubscribed = false;
    });
    // ignore: avoid_print
    print('Subscription stopped');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: const Text('Streams & Subscriptions - 411253001'),
        backgroundColor: Colors.white.withOpacity(0.15),
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor.withOpacity(0.9),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Praktikum 1: Background berganti warna otomatis setiap detik',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                ),
                const Divider(height: 32),
                Text(
                  'Angka Acak Terakhir (x10): $lastNumber',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Text(
                  'Aliran Nilai:\n$values',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  icon: const Icon(Icons.casino),
                  label: const Text('New Random Number (Praktikum 2-3)'),
                  onPressed: isSubscribed ? addRandomNumber : null,
                ),
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade100),
                  icon: const Icon(Icons.stop_circle, color: Colors.red),
                  label: const Text('Stop Subscription (Praktikum 4)', style: TextStyle(color: Colors.red)),
                  onPressed: isSubscribed ? stopSubscription : null,
                ),
                const SizedBox(height: 12),
                const Text(
                  'Catatan: Jika angka acak bernilai 5, aliran akan menampilkan "Error - " (Praktikum 2). Jika stop ditekan, tombol acak dinonaktifkan (Praktikum 4).',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
