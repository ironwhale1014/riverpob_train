import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpob_train/providers.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String value = ref.watch(helloProvider);
    var watch = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(title: Text(value)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$watch"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      ref.watch(counterProvider.notifier).increment();
                    },
                    child: const Icon(Icons.plus_one)),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      ref.watch(counterProvider.notifier).decrement();
                    },
                    child: const Icon(Icons.exposure_minus_1)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
