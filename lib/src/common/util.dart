import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

extension AutoDisposeRefExtension on AutoDisposeRef {
  // ref.onDispose: Provider가 소멸되기 직전에 트리거됨
  // ref.onCancel: Provider의 마지막 리스너가 제거될 때 트리거됨
  // ref.onResume: Provider가 일시 중지된 후 다시 청취할 때 트리거됨
  // ref.onAddListener: 새 리스너가 Provider에 추가될 때마다 트리거됨
  // ref.onRemoveListener: 새 리스너가 Provider에서 제거될 때마다 트리거됨

  // 데이터 캐싱
  void keepAliveForAWhile() {
    keepAliveFor(const Duration(minutes: 3));
  }

  // 데이터 캐싱
  void keepAliveFor(Duration duration) {
    final keepAliveLink = keepAlive();
    final timer = Timer(duration, () => keepAliveLink.close());
    onDispose(() => timer.cancel());
  }
}
