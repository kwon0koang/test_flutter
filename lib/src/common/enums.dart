import 'package:test_flutter/src/pages/test_social_login/login/google_login.dart';
import 'package:test_flutter/src/pages/test_social_login/login/kakao_login.dart';
import 'package:test_flutter/src/pages/test_social_login/login/social_login.dart';

enum SocialLoginType {
  google,
  kakao,
  none;

  SocialLogin? getSocialLogin() {
    if (this == SocialLoginType.google) {
      return GoogleLogin();
    } else if (this == SocialLoginType.kakao) {
      return KakaoLogin();
    } else {
      return null;
    }
  }
}
