import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:test_flutter/app.dart';
import 'package:test_flutter/src/const/strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  KakaoSdk.init(
    nativeAppKey: kakaoSdkNativeAppKey,
    javaScriptAppKey: kakaoSdkJavaScriptAppKey,
  );

  // runApp(const App());
  runApp(const ProviderScope(child: App()));
}
