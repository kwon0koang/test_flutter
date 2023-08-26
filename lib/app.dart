import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:test_flutter/app_router.dart';

final getIt = GetIt.instance;
final globalRouter = getIt<AppRouter>();

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    getIt.registerSingleton<AppRouter>(appRouter); // 싱글톤 라우터 :)

    final lightThemeData = ThemeData(
      useMaterial3: true,
    );
    final darkThemeData = ThemeData(
      useMaterial3: true,
    );

    // index.html 에서 호출
    final calledFromIndexHtmlToExport = allowInterop(calledFromIndexHtml);
    setProperty(globalThis, 'calledFromIndexHtml', calledFromIndexHtmlToExport);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: lightThemeData,
      darkTheme: darkThemeData,
      themeMode: ThemeMode.light, //ThemeMode.system,
      routeInformationParser: appRouter.defaultRouteParser(),
      routerDelegate: appRouter.delegate(),
    );
  }
}

void calledFromIndexHtml() {
  Fluttertoast.showToast(msg: 'calledFromIndexHtml');
  globalRouter.push(const TestCounterRoute());
}
