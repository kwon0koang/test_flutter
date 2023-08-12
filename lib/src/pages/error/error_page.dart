import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_flutter/src/common/default_layout_widget.dart';
import 'package:test_flutter/src/const/gaps.dart';

@RoutePage()
class ErrorPage extends HookConsumerWidget {
  const ErrorPage({
    super.key,
    required this.errMsg,
  });

  final String errMsg;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayoutWidget(
      title: '',
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(errMsg),
            gapH20,
            TextButton(
              onPressed: () {
                // Log.d('kyk / ${context.router.stack}');
                context.router.pop();
                // refresh.call();
              },
              child: const Text('리후레쉬'),
            ),
          ],
        ),
      ),
    );
  }
}
