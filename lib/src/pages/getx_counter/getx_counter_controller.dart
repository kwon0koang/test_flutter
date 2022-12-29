import 'package:get/get.dart';

class GetXCounterController extends GetxController {
  // static getInstance() => Get.find();
  static GetXCounterController get to => Get.find();

  RxInt count = 0.obs;

  void increase() {
    count++;
  }

  void decrease() {
    count--;
  }

}
