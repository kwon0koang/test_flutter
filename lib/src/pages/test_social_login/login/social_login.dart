import 'package:test_flutter/src/pages/test_social_login/model/social_login_model.dart';

abstract class SocialLogin {
  Future<bool> login();
  Future<bool> logout();
  Future<bool> disconnect();
  Future<SocialLoginModel> getModel();
}
