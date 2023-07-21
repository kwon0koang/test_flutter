import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_flutter/src/pages/test_firebase_database/model/stock_model.dart';
import 'package:test_flutter/src/pages/test_firebase_database/test_firebase_database_controller.dart';

class StocksWidget extends HookConsumerWidget {
  const StocksWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<StockModel>> asyncStocks =
        ref.watch(stocksNotifierProvider);
    final stocksNotifier = ref.watch(stocksNotifierProvider.notifier);
    return CustomScrollView(
      slivers: asyncStocks.when(
        error: (error, stackTrace) {
          return [
            SliverToBoxAdapter(
              child: Center(
                child: Text('에러입니다 ($error)'),
              ),
            ),
          ];
        },
        loading: () {
          return [
            const SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ];
        },
        data: (stocks) {
          return [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: stocks.length,
                (context, index) {
                  final stock = stocks[index];
                  return Row(
                    children: [
                      Text(
                        '${stock.stockCode} / ${stock.stockName}',
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          stocksNotifier.removeAndRefresh(stock.stockCode);
                        },
                        child: const Icon(
                          Icons.delete,
                          size: 30,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ];
        },
      ),
    );
  }
}
