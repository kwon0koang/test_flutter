import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter/src/pages/getx_counter/getx_counter_controller.dart';
import 'package:test_flutter/src/pages/getx_counter_service/getx_counter_service.dart';

class GetXStaticCounter extends StatelessWidget {
  const GetXStaticCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(GetXCounterService());

    return SafeArea(
      child: Container(
        child: Obx(
          () {
            return Column(
              children: [
                Text("${GetXCounterService.to.count}"),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    GetXCounterService.to.increase();
                  },
                  child: Text("+"),
                ),
                ElevatedButton(
                  onPressed: () {
                    GetXCounterService.to.decrease();
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
