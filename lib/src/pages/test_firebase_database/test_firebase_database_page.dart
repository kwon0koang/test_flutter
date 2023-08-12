import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_flutter/src/common/default_layout_widget.dart';
import 'package:test_flutter/src/pages/test_firebase_database/test_firebase_database_controller.dart';
import 'package:test_flutter/src/pages/test_firebase_database/widget/stocks_widget.dart';

@RoutePage()
class TestFirebaseDatabasePage extends HookConsumerWidget {
  const TestFirebaseDatabasePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stocksNotifier = ref.watch(stocksNotifierProvider.notifier);
    return DefaultLayoutWidget(
      title: '',
      child: Column(
        children: [
          InkWell(
            onTap: () {
              stocksNotifier.addOrUpdateAndRefresh('NVDA', '엔비디아');
              stocksNotifier.addOrUpdateAndRefresh('TSLA', '테슬라');
              stocksNotifier.addOrUpdateAndRefresh('AAPL', '애플');
            },
            child: const Icon(
              Icons.add,
              size: 30,
            ),
          ),
          const Expanded(
            child: StocksWidget(),
          ),
        ],
      ),
    );
  }
}
