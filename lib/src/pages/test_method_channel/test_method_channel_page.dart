import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_flutter/src/common/default_layout_widget.dart';
import 'package:test_flutter/src/pages/test_method_channel/test_method_channel_view_model.dart';

@RoutePage()
class TestMethodChannelPage extends HookConsumerWidget {
  const TestMethodChannelPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncPlatformVersion = ref.watch(platformVersionProvider);

    if (asyncPlatformVersion is AsyncData) {
      Fluttertoast.showToast(msg: asyncPlatformVersion.value.toString());
    }

    return DefaultLayoutWidget(
      title: 'Test method channel page',
      child: asyncPlatformVersion.when(
        error: (error, stackTrace) {
          return Center(
            child: Text('에러입니다 ($error)'),
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        data: (platformVersion) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  child: const Text("Get platform version"),
                  onPressed: () {
                    ref
                        .read(platformVersionProvider.notifier)
                        .getPlatformVersion();
                  },
                ),
                Text(platformVersion),
              ],
            ),
          );
        },
      ),
    );
  }
}
