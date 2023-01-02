import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter/src/pages/getx_mvvm/getx_mvvm_controller.dart';

class GetXMvvm extends StatelessWidget {
  const GetXMvvm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(GetXMvvmController());

    return SafeArea(
      child: Container(
        child: Obx(
          () {
            return Row(
              children: [
                Column(
                  children: [
                    Text("${GetXMvvmController.to.counterModels[0].count}"),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        GetXMvvmController.to.increase(0);
                      },
                      child: Text("+"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        GetXMvvmController.to.decrease(0);
                      },
                      child: Text("-"),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text("${GetXMvvmController.to.counterModels[1].count}"),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        GetXMvvmController.to.increase(1);
                      },
                      child: Text("+"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        GetXMvvmController.to.decrease(1);
                      },
                      child: Text("-"),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}