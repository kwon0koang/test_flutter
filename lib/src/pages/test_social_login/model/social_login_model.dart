import 'package:firebase_auth/firebase_auth.dart' as Google;
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as Kakao;
import 'package:test_flutter/src/common/enums.dart';

class SocialLoginModel {
  final SocialLoginType loginType;
  final Google.User? googleUser;
  final Kakao.User? kakaoUser;

  SocialLoginModel({
    required this.loginType,
    this.googleUser,
    this.kakaoUser,
  });
}
