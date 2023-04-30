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
              appRouter.push(const TodoListRoute());
            },
            child: const Text("Go todo list page"),
          ),
          gapH4,
          ElevatedButton(
            onPressed: () {
              appRouter.push(const TestSliverListRoute());
            },
            child: const Text("Go test sliver list page"),
          ),
          gapH4,
          ElevatedButton(
            onPressed: () {
              appRouter.push(const TestPagingRoute());
            },
            child: const Text("Go test paging page"),
          ),
        ],
      ),
    );
  }
}
