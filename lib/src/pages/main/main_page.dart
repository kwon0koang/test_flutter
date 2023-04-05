import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/app_router.dart';
import 'package:test_flutter/src/common/default_layout.dart';
import 'package:test_flutter/src/const/gaps.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appRouter = AutoRouter.of(context);

    return DefaultLayout(
      title: 'Main',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () {
              appRouter.push(const TestCounterRoute());
            },
            child: const Text("Go test counter page"),
          ),
          gapH4,
          ElevatedButton(
            onPressed: () {
              appRouter.push(const TestRetrofitRoute());
            },
            child: const Text("Go test retrofit page"),
          ),
          gapH4,
          ElevatedButton(
            onPressed: () {
              appRouter.push(const TestRetrofit2Route());
            },
            child: const Text("Go test retrofit2 page"),
          ),
        ],
      ),
    );
  }
}
