import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:test_flutter/app_router.gr.dart';
import 'package:test_flutter/src/common/log.dart';
import 'package:test_flutter/src/pages/error/error_page.dart';

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
}

bool isErrorShowing = false;
showErrorDialog(
  BuildContext context,
  String errMsg, {
  required Function refresh,
}) async {
  final isErrorShowing = context.router.stack
      .where((routePage) => routePage.name == ErrorRoute.name)
      .isNotEmpty;
  if (isErrorShowing) {
    return;
  }

  await Navigator.push(
    context,
    PageTransition(
      type: PageTransitionType.scale,
      alignment: Alignment.bottomCenter,
      child: ErrorPage(errMsg: errMsg),
    ),
  );
  // await context.router.push(
  //   ErrorRoute(errMsg: errMsg),
  // );
  refresh.call();

  // if (isErrorShowing) {
  //   return;
  // }

  // isErrorShowing = true;
  // showDialog<String>(
  //   context: context,
  //   barrierDismissible: false,
  //   barrierColor: Colors.transparent,
  //   barrierLabel: null,
  //   builder: (BuildContext context) {
  //     return Dialog.fullscreen(
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: <Widget>[
  //           Text(errMsg),
  //           gapH20,
  //           TextButton(
  //             onPressed: () {
  //               context.router.pop();
  //               refresh.call();
  //             },
  //             child: const Text('리후레쉬'),
  //           ),
  //         ],
  //       ),
  //     );
  //   },
  // ).whenComplete(() {
  //   Log.d('kyk / isErrorShowing = false');
  //   isErrorShowing = false;
  // });
}

/// 현재 한국 시간 가져오기
DateTime nowDate() => DateTime.now().toUtc().add(const Duration(hours: 9));

/// 콜스택 출력
void printCallStack({
  String? tag,
}) {
  try {
    StackTrace currentStack = StackTrace.current;
    String stackTraceString = currentStack.toString();
    List<String> lines = stackTraceString.split("\n");
    if (lines.length >= 3) {
      // 첫 번째 라인은 "StackTrace (most recent call last):"이므로 제거합니다.
      lines.removeAt(0);
      // 두 번째 라인은 현재 함수 호출이므로 다시 제거합니다.
      lines.removeAt(0);

      // 필요없는 부분들 다 제거
      lines = lines
          .where((line) =>
              !line.contains("packages/flutter/src/") &&
              !line.contains("dart-sdk/lib/") &&
              !line.contains("lib/_engine/engine/") &&
              line.isNotEmpty)
          .map(
        (line) {
          // 파일 경로에서 파일명과 라인/칼럼 정보만 추출합니다.
          final fileNameStartIndex = line.lastIndexOf('/') + 1;
          String formattedLine = line.substring(fileNameStartIndex);

          // 중복 스페이스를 하나로 줄입니다.
          formattedLine = formattedLine.replaceAll(RegExp(r'\s+'), ' ');

          // 마지막 값을 괄호로 묶습니다.
          final lastSpaceIndex = formattedLine.lastIndexOf(' ');
          if (lastSpaceIndex >= 0) {
            formattedLine =
                '${formattedLine.replaceRange(lastSpaceIndex, lastSpaceIndex + 1, ' (')})';
          }

          return formattedLine;
        },
      ).toList();

      // 출력
      String callStack = lines.join(' 🥰 ');
      final msg = (tag == null || tag.isEmpty == true)
          ? callStack
          : '[$tag] $callStack';
      Log.d(msg);
    } else {
      Log.d('콜스택을 가져올 수 없습니다.');
    }
  } catch (e) {
    Log.d('콜스택을 가져올 수 없습니다. e : $e');
  }
}
