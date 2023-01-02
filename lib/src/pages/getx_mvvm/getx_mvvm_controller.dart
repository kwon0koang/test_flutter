import 'dart:developer';

import 'package:get/get.dart';
import 'package:test_flutter/src/pages/getx_mvvm/counter_model.dart';

class GetXMvvmController extends GetxController {
  static GetXMvvmController get to => Get.find();

  static const int ITEM_SIZE = 2;

  RxList<CounterModel> _counterModels = <CounterModel>[].obs;
  List<CounterModel> get counterModels => _counterModels;

  @override
  void onInit() {
    super.onInit();
    for (int i = 0; i < ITEM_SIZE; i++) {
      _counterModels.add(CounterModel());
    }
  }

  void increase(int index) {
    _counterModels[index].increase();
    _counterModels.refresh();   // GetX의 RxList는 Item요소의 변수값이 바뀌었는지 감지할 수 없음. 수동 refresh 처리 필요
  }

  void decrease(int index) {
    _counterModels[index].decrease();
    _counterModels.refresh();   // GetX의 RxList는 Item요소의 변수값이 바뀌었는지 감지할 수 없음. 수동 refresh 처리 필요
  }

}
