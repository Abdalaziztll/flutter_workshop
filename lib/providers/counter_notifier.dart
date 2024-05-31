import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterNotifier extends StateNotifier {
  CounterNotifier() : super(0);
  void increamnt() {
    state++;
  }
}

final counterProviderWithStateNotifier = StateNotifierProvider(
  (ref) {
    return CounterNotifier();
  },
);
