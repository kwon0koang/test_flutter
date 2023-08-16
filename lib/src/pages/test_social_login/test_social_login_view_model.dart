import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_flutter/src/common/enums.dart';
import 'package:test_flutter/src/common/log.dart';
import 'package:test_flutter/src/pages/test_social_login/login/social_login.dart';
import 'package:test_flutter/src/pages/test_social_login/model/social_login_model.dart';

part 'test_social_login_view_model.g.dart';

@riverpod
class LoginStatus extends _$LoginStatus {
  @override
  FutureOr<SocialLoginModel> build() async {
    return SocialLoginModel(
      loginType: SocialLoginType.none,
    );
  }

  Future<void> login(SocialLogin socialLogin) async {
    final isLogined = await socialLogin.login();
    Log.d('isLogined = $isLogined');
    if (!isLogined) {
      state = AsyncData(
        SocialLoginModel(
          loginType: SocialLoginType.none,
        ),
      );
      return;
    }

    final model = await socialLogin.getModel();
    Log.d('model = $model');

    state = AsyncData(model);
  }

  Future<void> logout(SocialLogin socialLogin) async {
    socialLogin.logout();
    state = AsyncData(
      SocialLoginModel(
        loginType: SocialLoginType.none,
      ),
    );
  }

  Future<void> disconnect(SocialLogin socialLogin) async {
    socialLogin.disconnect();
    state = AsyncData(
      SocialLoginModel(
        loginType: SocialLoginType.none,
      ),
    );
  }
}
