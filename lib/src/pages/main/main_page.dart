import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/app_router.dart';
import 'package:test_flutter/src/common/default_layout.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appRouter = AutoRouter.of(context);

    return DefaultLayout(
      title: 'Main',
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              appRouter.push(const TestCounterRoute());
            },
            child: const Text("Go test counter page"),
          ),
          const SizedBox(
            height: 4,
          ),
          ElevatedButton(
            onPressed: () {
              appRouter.push(const TestRetrofitRoute());
            },
            child: const Text("Go test retrofit page"),
          ),
        ],
      ),
    );
  }
}
