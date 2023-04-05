import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:test_flutter/src/common/default_layout.dart';
import 'package:test_flutter/src/common/log.dart';
import 'package:test_flutter/src/model/todo_model.dart';
import 'package:test_flutter/src/pages/test_counter/test_counter_view_model.dart';
import 'package:test_flutter/src/pages/test_retrofit/test_retrofit_view_model.dart';
import 'package:test_flutter/src/pages/test_retrofit2/test_retrofit2_view_model.dart';

@RoutePage()
class TestRetrofit2Page extends HookConsumerWidget {
  const TestRetrofit2Page({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final retrofitProvider = ref.watch(testRetrofitStateNotifierProvider);

    return DefaultLayout(
      title: 'Test retrofit2',
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$retrofitProvider',
                style: const TextStyle(fontSize: 20, color: Colors.deepOrange),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  ref
                      .read(testRetrofitStateNotifierProvider.notifier)
                      .getTodos();
                },
                child: const Text('Send'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
