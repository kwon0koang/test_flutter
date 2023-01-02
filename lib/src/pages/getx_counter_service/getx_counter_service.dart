import 'package:get/get.dart';

class GetXCounterService extends GetxService {
  // static getInstance() => Get.find();
  static GetXCounterService get to => Get.find();

  // RxInt count = 0.obs;
  var count = 0.obs;

  void increase() {
    count++;
  }

  void decrease() {
    count--;
  }

}
