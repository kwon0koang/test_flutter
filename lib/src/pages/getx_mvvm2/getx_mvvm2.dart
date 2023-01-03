import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter/src/pages/getx_mvvm/getx_mvvm_controller.dart';
import 'package:test_flutter/src/pages/getx_mvvm2/getx_mvvm2_controller.dart';
import 'package:test_flutter/src/pages/getx_mvvm2/getx_mvvm2_repository.dart';

class GetXMvvm2 extends StatelessWidget {
  const GetXMvvm2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(GetXMvvm2Controller(getXMvvm2Repository: GetXMvvm2Repository()));

    return SafeArea(
      child: Container(
        child: Obx(
          () => Row(
            children: [
              Column(
                children: [
                  Text(
                    "title : ${GetXMvvm2Controller.to.article?.title}",
                    style: TextStyle(fontSize: 20, color: Colors.blue),
                  ),
                  Text(
                    "content : ${GetXMvvm2Controller.to.article?.content}",
                    style: TextStyle(fontSize: 20, color: Colors.blue),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      GetXMvvm2Controller.to.getArticle();
                    },
                    child: Text("조회"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
