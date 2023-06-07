import 'package:flutter/material.dart';
import 'package:test_flutter/app_router.dart';
import 'package:test_flutter/material-theme/color_schemes.g.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    final lightThemeData = ThemeData(
      useMaterial3: true,
      colorScheme: lightColorScheme,
    );
    final darkThemeData = ThemeData(
      useMaterial3: true,
      colorScheme: darkColorScheme,
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: true,
      theme: lightThemeData,
      darkTheme: darkThemeData,
      themeMode: ThemeMode.light, //ThemeMode.system,
      routeInformationParser: appRouter.defaultRouteParser(),
      routerDelegate: appRouter.delegate(),
    );
  }
}
