import 'package:test_flutter/src/common/log.dart';
import 'package:test_flutter/src/common/util.dart';

/// Provider 빌드된 시간 체크하기 위함
mixin CheckBuilded {
  DateTime builded = nowDate();

  /// build된 시간 이후 N 미만으로 지났는지 체크
  bool checkForLessThanN({
    required Duration duration,
  }) {
    final now = nowDate();
    Duration timeDifference = now.difference(builded);
    final result = timeDifference < duration;

    Log.d('result : $result / builded : $builded / now : $now');

    return result;
  }

  /// build된 시간 1초 미만으로 지났는지 체크
  bool checkForLessThan1s() => checkForLessThanN(
        duration: const Duration(seconds: 1),
      );
}
