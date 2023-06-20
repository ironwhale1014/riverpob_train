import 'package:flutter_riverpod/flutter_riverpod.dart';

final helloProvider = Provider<String>((ref) {
  return "hello RiverPod";
});

final counterProvider =
    NotifierProvider<CounterNotifier, int>(() => CounterNotifier());

class CounterNotifier extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void increment()=>state++;
  void decrement()=>state--;
}
