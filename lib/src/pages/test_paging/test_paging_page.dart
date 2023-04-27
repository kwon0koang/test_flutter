import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_flutter/src/common/default_layout_widget.dart';

@RoutePage()
class TestPagingPage extends HookConsumerWidget {
  const TestPagingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const DefaultLayoutWidget(
      title: 'Test paging page',
      child: Text('Test paging page'),
    );
  }
}
