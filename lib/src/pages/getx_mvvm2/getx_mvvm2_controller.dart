import 'package:get/get.dart';
import 'package:test_flutter/src/pages/getx_mvvm2/article_model.dart';
import 'package:test_flutter/src/pages/getx_mvvm2/getx_mvvm2_repository.dart';

class GetXMvvm2Controller extends GetxController {
  static GetXMvvm2Controller get to => Get.find();

  final GetXMvvm2Repository getXMvvm2Repository;

  GetXMvvm2Controller({required this.getXMvvm2Repository});

  final Rx<ArticleModel?> _article = Rx<ArticleModel?>(null);
  ArticleModel? get article => _article.value;

  Future<void> getArticle() async {
    _article.value = await getXMvvm2Repository.getArticle();
  }

}
