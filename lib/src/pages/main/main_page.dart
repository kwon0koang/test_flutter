import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/app_router.dart';
import 'package:test_flutter/src/common/default_layout_widget.dart';
import 'package:test_flutter/src/const/gaps.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appRouter = AutoRouter.of(context);

    return DefaultLayoutWidget(
      title: 'Main',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
            onPressed: () {
              appRouter.push(const TestCounterRoute());
            },
            child: const Text('Test counter'),
          ),
          gapH4,
          ElevatedButton(
            onPressed: () {
              appRouter.push(const TestRiverpodRoute());
            },
            child: const Text('Test riverpod'),
          ),
          gapH4,
          ElevatedButton(
            onPressed: () {
              appRouter.push(const TodoListRoute());
            },
            child: const Text('Todo list'),
          ),
          gapH4,
          ElevatedButton(
            onPressed: () {
              appRouter.push(const TestSliverListRoute());
            },
            child: const Text('Test sliver list'),
          ),
          gapH4,
          ElevatedButton(
            onPressed: () {
              appRouter.push(const TestMethodChannelRoute());
            },
            child: const Text('Test method channel'),
          ),
          gapH4,
          ElevatedButton(
            onPressed: () {
              appRouter.push(const TestSocialLoginRoute());
            },
            child: const Text('Test social login'),
          ),
        ],
      ),
    );
  }
}
