import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:test_flutter/src/pages/getx_mvvm/counter_model.dart';
import 'package:test_flutter/src/pages/getx_mvvm2/article_model.dart';

class GetXMvvm2Repository {

  Future<ArticleModel> getArticle() async {
    sleep(Duration(seconds: 1));    // 가져오는 시간 1초
    var model = ArticleModel();
    model.title = "test title 123";
    model.content = "test content 123";
    return model;
  }

}
