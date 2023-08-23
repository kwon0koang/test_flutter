import 'dart:js_util';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_flutter/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

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
      scaffoldMessengerKey: GlobalVariable.scaffoldMessengerState,
    );
  }
}

void calledFromIndexHtml() {
  Fluttertoast.showToast(msg: 'calledFromIndexHtml');
  final context = GlobalVariable.scaffoldMessengerState.currentState?.context;
  context?.router.push(const TestCounterRoute());
  // GetIt.instance<AppRouter>().push(const TestCounterRoute());
}

class GlobalVariable {
  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerState =
      GlobalKey<ScaffoldMessengerState>();
}

// @JSExport()
// class Export {
//   @JSExport('printHelloWorld')
//   void printMessage() => Log.d('Hello World!');
// }
