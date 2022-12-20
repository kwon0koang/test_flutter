import 'package:get/get.dart';

class GetXCounterController extends GetxController {
  RxInt count = 0.obs;

  void increase() {
    count++;
  }

  void decrease() {
    count--;
  }

}
