import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:test_flutter/app.dart';
import 'package:test_flutter/src/const/strings.dart';

void main() {
  KakaoSdk.init(nativeAppKey: kakaoSdkKey);

  // runApp(const App());
  runApp(const ProviderScope(child: App()));
}
