import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_flutter/src/common/log.dart';
import 'package:test_flutter/src/common/util.dart';
import 'package:test_flutter/src/pages/test_firebase_database/model/stock_model.dart';

part 'test_firebase_database_controller.g.dart';

@riverpod
class StocksNotifier extends _$StocksNotifier {
  @override
  FutureOr<List<StockModel>> build() {
    ref.keepAliveForAWhile();
    return _getStocks();
  }

  Future<List<StockModel>> _getStocks() async {
    if (state is! AsyncData) {
      state = const AsyncLoading();
    }

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final stock = await firestore.collection(StockModel.collectionName).get();
    final docs = stock.docs;
    final stocks = docs
        .map(
          (doc) => StockModel.fromJson(doc.data()),
        )
        .toList();

    return stocks;
  }

  Future<void> refresh() async {
    state = await AsyncValue.guard(
      () => _getStocks(),
    );
  }

  void addOrUpdateAndRefresh(String stockCode, String stockName) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // stock 컬렉션에서 해당 stockCode와 일치하는 문서를 쿼리합니다.
    QuerySnapshot querySnapshot = await firestore
        .collection(StockModel.collectionName)
        .where(StockModel.columnStockCode, isEqualTo: stockCode)
        .get();
    final isExist = querySnapshot.docs.isNotEmpty;
    if (isExist) {
      // 해당하는 문서가 존재하면 업데이트합니다.
      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        await documentSnapshot.reference.update({
          StockModel.columnStockName: stockName,
        });
      }
      Log.d('$stockName 업데이트 완료');
    } else {
      // 해당하는 문서가 존재하지 않으면 추가합니다.
      await firestore.collection(StockModel.collectionName).add({
        StockModel.columnStockCode: stockCode,
        StockModel.columnStockName: stockName,
      });
      Log.d('$stockName 추가 완료');
    }

    refresh();
  }

  void removeAndRefresh(String stockCode) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    final stocks = await firestore
        .collection(StockModel.collectionName)
        .where(StockModel.columnStockCode, isEqualTo: stockCode)
        .get();

    for (QueryDocumentSnapshot documentSnapshot in stocks.docs) {
      await documentSnapshot.reference.delete();
    }

    refresh();
  }
}
