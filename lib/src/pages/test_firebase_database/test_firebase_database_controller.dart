import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_flutter/src/common/util.dart';
import 'package:test_flutter/src/pages/test_firebase_database/model/stock_model.dart';

part 'test_firebase_database_controller.g.dart';

@riverpod
class StocksNotifier extends _$StocksNotifier {
  final collectionName = 'stock';
  final columnStockCode = 'stock_code';
  final columnStockName = 'stock_name';

  @override
  FutureOr<List<StockModel>> build() {
    ref.keepAliveForAWhile();
    return _getStocks();
  }

  Future<List<StockModel>> _getStocks() async {
    if (state is! AsyncData) {
      state = const AsyncLoading();
    }

    // 테스트 지연
    await Future.delayed(const Duration(seconds: 1));

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final stock = await firestore.collection(collectionName).get();
    final docs = stock.docs;
    final stocks = docs
        .map(
          (doc) => StockModel(
            stockCode: doc[columnStockCode],
            stockName: doc[columnStockName],
          ),
        )
        .toList();

    return stocks;
  }

  Future<void> refresh() async {
    state = await AsyncValue.guard(
      () => _getStocks(),
    );
  }

  void addAndRefresh(String stockCode, String stockName) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    await firestore.collection(collectionName).add({
      columnStockCode: stockCode,
      columnStockName: stockName,
    });

    refresh();
    // final isExist = querySnapshot.docs.isNotEmpty;

    // if (isExist) {
    //   for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
    //     await documentSnapshot.reference.update({
    //       stockName: stockName,
    //     });
    //   }
    // } else {
    //   await firestore.collection(collectionName).add({
    //     columnStockCode: stockCode,
    //     columnStockName: stockName,
    //   });
    // }
  }

  void removeAndRefresh(String stockCode) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    final stocks = await firestore
        .collection(collectionName)
        .where(columnStockCode, isEqualTo: stockCode)
        .get();

    for (QueryDocumentSnapshot documentSnapshot in stocks.docs) {
      await documentSnapshot.reference.delete();
    }

    refresh();
  }
}
