import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_flutter/src/common/log.dart';

part 'test_riverpod_view_model.g.dart';

@riverpod
class TestInt1 extends _$TestInt1 {
  @override
  FutureOr<int> build() async {
    return request(0);
  }

  Future<int> request(int num) async {
    await Future.delayed(const Duration(milliseconds: 500));
    Log.d('kyk / testInt1');
    return num;
  }

  Future<void> increment() async {
    state = await AsyncValue.guard(
      () => request(state.value! + 1),
    );
  }
}

@riverpod
class TestInt2 extends _$TestInt2 {
  @override
  FutureOr<int> build() async {
    return request(10);
  }

  Future<int> request(int num) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    Log.d('kyk / testInt2');
    return num;
  }

  Future<void> increment() async {
    state = await AsyncValue.guard(
      () => request(state.value! + 1),
    );
  }
}

@riverpod
class TestInt3 extends _$TestInt3 {
  @override
  FutureOr<int> build() async {
    return request(100);
  }

  Future<int> request(int num) async {
    await Future.delayed(const Duration(milliseconds: 1500));
    Log.d('kyk / testInt3');
    return num;
  }

  Future<void> increment() async {
    state = await AsyncValue.guard(
      () => request(state.value! + 1),
    );
  }
}

@riverpod
AsyncValue<int> testInt1And2(TestInt1And2Ref ref) {
  final testInt1 = ref.watch(testInt1Provider);
  final testInt2 = ref.watch(testInt2Provider);
  if (testInt1 is! AsyncData || testInt2 is! AsyncData) {
    return const AsyncLoading();
  }
  Log.d('kyk / testInt1And2');
  return AsyncData(testInt1.value! + testInt2.value!);
}

@riverpod
AsyncValue<int> testInt1And3(TestInt1And3Ref ref) {
  final testInt1 = ref.watch(testInt1Provider);
  final testInt2 = ref.watch(testInt3Provider);
  if (testInt1 is! AsyncData || testInt2 is! AsyncData) {
    return const AsyncLoading();
  }
  Log.d('kyk / testInt1And3');
  return AsyncData(testInt1.value! + testInt2.value!);
}

@riverpod
AsyncValue<int> testInt2And3(TestInt2And3Ref ref) {
  final testInt1 = ref.watch(testInt2Provider);
  final testInt2 = ref.watch(testInt3Provider);
  if (testInt1 is! AsyncData || testInt2 is! AsyncData) {
    return const AsyncLoading();
  }
  Log.d('kyk / testInt2And3');
  return AsyncData(testInt1.value! + testInt2.value!);
}

@riverpod
class TestInt2And3_2 extends _$TestInt2And3_2 {
  @override
  AsyncValue<int> build() {
    final testInt1 = ref.watch(testInt2Provider);
    final testInt2 = ref.watch(testInt3Provider);
    if (testInt1 is! AsyncData || testInt2 is! AsyncData) {
      return const AsyncLoading();
    }
    Log.d('kyk / testInt2And3_2');
    return AsyncData(testInt1.value! + testInt2.value!);
  }

  forceUpdate(int num) {
    state = AsyncData(num);
  }
}
