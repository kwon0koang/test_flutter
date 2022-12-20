import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter/src/pages/getx_counter_controller.dart';

class GetXCounter extends StatelessWidget {
  const GetXCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(GetXCounterController());

    return SafeArea(
      child: Container(
        child: Obx(
          () {
            return Column(
              children: [
                Text("${controller.count}"),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.increase();
                  },
                  child: Text("+"),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.decrease();
                  },
                  child: Text("-"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
