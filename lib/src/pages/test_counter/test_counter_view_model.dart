import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_flutter/src/common/log.dart';

part 'test_counter_view_model.g.dart';

@riverpod
class CountStateNotifier extends _$CountStateNotifier {
  @override
  int build() {
    return 0;
  }

  void increment() {
    state++;
    Log.d(state);
  }

  void decrement() {
    state--;
    Log.d(state);
  }
}
