import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_flutter/src/common/log.dart';

extension RefExtension on Ref {
  // We can move the previous logic to a Ref extension.
  // This enables reusing the logic between providers
  T disposeAndListenChangeNotifier<T extends ChangeNotifier>(T notifier) {
    onDispose(notifier.dispose);
    notifier.addListener(notifyListeners);
    // We return the notifier to ease the usage a bit
    return notifier;
  }
}

extension AutoDisposeRefExtension on AutoDisposeRef {
  // ref.onDispose: Provider가 소멸되기 직전에 트리거됨
  // ref.onCancel: Provider의 마지막 리스너가 제거될 때 트리거됨
  // ref.onResume: Provider가 일시 중지된 후 다시 청취할 때 트리거됨
  // ref.onAddListener: 새 리스너가 Provider에 추가될 때마다 트리거됨
  // ref.onRemoveListener: 새 리스너가 Provider에서 제거될 때마다 트리거됨

  /// 데이터 캐싱
  void keepAliveForAWhile() {
    keepAliveFor(const Duration(minutes: 3));
  }

  /// 데이터 캐싱
  void keepAliveFor(Duration duration) {
    final keepAliveLink = keepAlive();
    final timer = Timer(duration, keepAliveLink.close);
    onDispose(timer.cancel);
  }

  /// 초기화
  void invalidateSelfFor(Duration duration) {
    final timer = Timer(duration, invalidateSelf);
    onDispose(timer.cancel);
  }

  /// 생명주기 추적
  void printLifeCycle({required String tag}) {
    onAddListener(() {
      Log.d('$tag | onAddListener');
    });
    onRemoveListener(() {
      Log.d('$tag | onRemoveListener');
    });
    onCancel(() {
      Log.d('$tag | onCancel');
    });
    onResume(() {
      Log.d('$tag | onResume');
    });
    onDispose(() {
      Log.d('$tag | onDispose');
    });
  }

  // We can move the previous logic to a Ref extension.
  // This enables reusing the logic between providers
  T disposeAndListenChangeNotifier<T extends ChangeNotifier>(T notifier) {
    onDispose(notifier.dispose);
    notifier.addListener(notifyListeners);
    // We return the notifier to ease the usage a bit
    return notifier;
  }
}
