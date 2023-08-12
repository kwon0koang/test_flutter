import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_flutter/app_router.gr.dart';
import 'package:test_flutter/src/common/default_layout_widget.dart';
import 'package:test_flutter/src/common/log.dart';
import 'package:test_flutter/src/common/util.dart';
import 'package:test_flutter/src/const/gaps.dart';
import 'package:test_flutter/src/pages/test_riverpod/test_riverpod_view_model.dart';

@RoutePage()
class TestRiverpodPage extends HookConsumerWidget {
  const TestRiverpodPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final testInt1 = ref.watch(testInt1Provider);
    final testInt2 = ref.watch(testInt2Provider);
    final testInt3 = ref.watch(testInt3Provider);
    final testInt1And2 = ref.watch(testInt1And2Provider);
    final testInt1And3 = ref.watch(testInt1And3Provider);
    final testInt2And3 = ref.watch(testInt2And3Provider);
    final testInt2And3_2 = ref.watch(testInt2And3_2Provider);

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        testInt2.when(
          data: (data) {},
          error: (error, stackTrace) {
            showErrorDialog(
              context,
              error.toString(),
              refresh: () {
                ref.read(testInt2Provider.notifier).increment();
                ref.read(testInt3Provider.notifier).increment();
              },
            );
          },
          loading: () {},
        );
        testInt3.when(
          data: (data) {},
          error: (error, stackTrace) {
            showErrorDialog(
              context,
              error.toString(),
              refresh: () {
                ref.read(testInt2Provider.notifier).increment();
                ref.read(testInt3Provider.notifier).increment();
              },
            );
          },
          loading: () {},
        );
      },
    );

    return DefaultLayoutWidget(
      title: '',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
            onPressed: () {
              context.router.push(const TestRiverpodRoute());
            },
            child: Text('Provider 1 - $testInt1'),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(testInt2Provider.notifier).increment();
            },
            child: Text('Provider 2 - $testInt2'),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(testInt3Provider.notifier).increment();

              Log.d('kyk / ${context.router.stack}');
            },
            child: Text('Provider 3 - $testInt3'),
          ),
          gapH20,
          const Text('결합 ==========================='),
          Text('Provider 1+2 - $testInt1And2'),
          Text('Provider 1+3 - $testInt1And3'),
          Text('Provider 2+3 - $testInt2And3'),
          ElevatedButton(
            onPressed: () {
              ref.read(testInt2And3_2Provider.notifier).forceUpdate(9999999);
            },
            child: Text('Provider 2+3_2 - $testInt2And3_2'),
          ),
        ],
      ),
    );
  }
}
