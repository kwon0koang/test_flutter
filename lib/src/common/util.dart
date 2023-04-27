import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

extension AutoDisposeRefExtension on AutoDisposeRef {
  // 데이터 캐싱
  void keepAliveForAWhile() {
    keepAliveFor(const Duration(minutes: 3));
  }

  // 데이터 캐싱
  void keepAliveFor(Duration duration) {
    final link = keepAlive();
    final timer = Timer(duration, () => link.close());
    onDispose(() => timer.cancel());
  }
}
