import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:test_flutter/app_router.gr.dart';
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

void showToast(String msg) => Fluttertoast.showToast(msg: msg);

/// 현재 한국 시간 가져오기
DateTime nowDate() => DateTime.now().toUtc().add(const Duration(hours: 9));
