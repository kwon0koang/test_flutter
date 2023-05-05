import 'package:flutter/material.dart';
import 'package:test_flutter/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    final themeData = ThemeData(
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: Colors.black,
          ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blueAccent,
        background: Colors.blueAccent,
      ),
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: true,
      theme: themeData,
      routeInformationParser: appRouter.defaultRouteParser(),
      routerDelegate: appRouter.delegate(),
    );
  }
}
