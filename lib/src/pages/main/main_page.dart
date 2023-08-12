import 'dart:html';
import 'dart:ui' as ui;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/app_router.dart';
import 'package:test_flutter/src/common/default_layout_widget.dart';
import 'package:test_flutter/src/common/pre_load_widget.dart';
import 'package:test_flutter/src/const/gaps.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayoutWidget(
      title: '',
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const PreLoadWidget(),
            ElevatedButton(
              onPressed: () {
                context.router.push(const TestCounterRoute());
              },
              child: const Text('Test counter'),
            ),
            gapH4,
            ElevatedButton(
              onPressed: () {
                context.router.push(const TestRiverpodRoute());
              },
              child: const Text('Test riverpod'),
            ),
            gapH4,
            ElevatedButton(
              onPressed: () {
                context.router.push(const TodoListRoute());
              },
              child: const Text('Todo list'),
            ),
            gapH4,
            ElevatedButton(
              onPressed: () {
                context.router.push(const TestSliverListRoute());
              },
              child: const Text('Test sliver list'),
            ),
            gapH4,
            ElevatedButton(
              onPressed: () {
                context.router.push(const TestMethodChannelRoute());
              },
              child: const Text('Test method channel'),
            ),
            gapH4,
            ElevatedButton(
              onPressed: () {
                context.router.push(const TestSocialLoginRoute());
              },
              child: const Text('Test social login'),
            ),
            gapH4,
            ElevatedButton(
              onPressed: () {
                context.router.push(const TestFirebaseDatabaseRoute());
              },
              child: const Text('Test firebase database'),
            ),
            gapH4,
            ElevatedButton(
              onPressed: () {
                context.router.push(const TestCheckImgCorsErrorRoute());
              },
              child: const Text('Test check img cors error'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyNetworkImage extends StatelessWidget {
  const MyNetworkImage({
    super.key,
    required this.url,
    this.width,
    this.height,
  });

  final String url;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    // https://github.com/flutter/flutter/issues/41563
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      url,
      (int _) => ImageElement(
        src: url,
      ),
    );
    return SizedBox(
      width: width,
      height: height,
      child: HtmlElementView(
        viewType: url,
      ),
    );
  }
}
